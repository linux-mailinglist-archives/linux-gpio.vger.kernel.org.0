Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C86E16EBC0
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2020 17:51:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730719AbgBYQv5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Feb 2020 11:51:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:52374 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730530AbgBYQv5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 25 Feb 2020 11:51:57 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 849D72082F;
        Tue, 25 Feb 2020 16:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582649516;
        bh=EIWuYGd2PI/Y2afNvXrRAYGM45sNmOcnsA/coFhECeY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=sCGwIDsK6XwrddcnsOTLjCilO1Y3IBy+5Dm4Pml9TTMa+InyYUq9vk3eEleLEtVdF
         TZPiPEkEdHF5UiHr2oti6IfnVCxx0HLNb4XBlKmI1KOszaQJberzt1OYKIQHp7DVrH
         eXi9oQ8dAM8pux+fNvE0VzfiwuYVY0LZKqjp0cm4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <10e97a04980d933b2cfecb6b124bf9046b6e4f16.1582216144.git.leonard.crestez@nxp.com>
References: <cover.1582216144.git.leonard.crestez@nxp.com> <10e97a04980d933b2cfecb6b124bf9046b6e4f16.1582216144.git.leonard.crestez@nxp.com>
Subject: Re: [PATCH v2 1/8] clk: imx: Align imx sc clock msg structs to 4
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Fabio Estevam <fabio.estevam@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stefan Agner <stefan@agner.ch>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Anson Huang <anson.huang@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>,
        Franck LENORMAND <franck.lenormand@nxp.com>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
To:     Dong Aisheng <aisheng.dong@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>
Date:   Tue, 25 Feb 2020 08:51:55 -0800
Message-ID: <158264951569.54955.16797064769391310232@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Leonard Crestez (2020-02-20 08:29:32)
> The imx SC api strongly assumes that messages are composed out of
> 4-bytes words but some of our message structs have odd sizeofs.
>=20
> This produces many oopses with CONFIG_KASAN=3Dy.
>=20
> Fix by marking with __aligned(4).
>=20
> Fixes: fe37b4820417 ("clk: imx: add scu clock common part")
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
> ---
>  drivers/clk/imx/clk-scu.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
> index fbef740704d0..3c5c42d8833e 100644
> --- a/drivers/clk/imx/clk-scu.c
> +++ b/drivers/clk/imx/clk-scu.c
> @@ -41,16 +41,16 @@ struct clk_scu {
>  struct imx_sc_msg_req_set_clock_rate {
>         struct imx_sc_rpc_msg hdr;
>         __le32 rate;
>         __le16 resource;
>         u8 clk;
> -} __packed;
> +} __packed __aligned(4);

Sorry, this still doesn't make sense to me. Having __aligned(4) means
that the struct is placed on the stack at some alignment, great, but it
still has __packed so the sizeof this struct is some odd number like 11.
If this struct is the last element on the stack it will end at some
unaligned address and the mailbox code will read a few bytes beyond the
end of the stack.

I see that the calling code puts 3 as the 'size' for this struct in
clk_scu_set_rate().

	hdr->size =3D 3;

That seems to say that the struct is 3 words long, or 12 bytes. Then we
call imx_scu_call_rpc(), passing the pointer to this struct on the stack
and that eventually gets into imx_scu_ipc_write() calling
mbox_send_message() with u32 pointers.

	for (i =3D 0; i < hdr->size; i++) {
		sc_chan =3D &sc_ipc->chans[i % 4];
		ret =3D mbox_send_message(sc_chan->ch, &data[i]);

So we've taken the 11 byte struct (data in this case) and casted it to a
u32 array with 3 elements, which is bad. This is what kasan is warning
about. Adding aligned sometimes fixes it because the compiler will place
the next stack variable at the naturally aligned location and thus we
get the one byte padding but I don't see how that works when it's the
last stack element. The stack will end at some unaligned address.

The better solution would be to drop __aligned(4) and make a union of
the struct with whatever size number of words the message is or do a
copy of the struct into a u32 array that is passed to
imx_scu_call_rpc().

For example:

	struct imx_sc_msg_req_set_clock_rate {
		union {
			struct packed_message {
				struct imx_sc_rpc_msg hdr;
				__le32 rate;
				__le16 resource;
				u8 clk;
			} __packed;
			u32 data[3];
		};
	};

If the union approach was used then each time imx_scu_call_rpc() is
called we can simply pass the 'data' member and make the second argument
'msg' strongly typed to be a u32 pointer. kasan should be happy too.
