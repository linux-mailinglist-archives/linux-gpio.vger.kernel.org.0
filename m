Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F74529FCB0
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Oct 2020 05:28:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726429AbgJ3E2q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Oct 2020 00:28:46 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:42865 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725996AbgJ3E2q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 30 Oct 2020 00:28:46 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 192D05C0090;
        Fri, 30 Oct 2020 00:28:45 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute3.internal (MEProxy); Fri, 30 Oct 2020 00:28:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=e2RH6Oc3M7SvKnMtNThQnLEbeG9dZOv
        VUE8jjeVMZh0=; b=iVr98EiCIc3Lug+YMxm6Xf0sPZBOxzi0fQ52xAtTZPnuP3f
        rz3E0TMGmmOd2XsCM7s3kEmmyYpbCjxYtkwvVQSef/NK1SBIa5rQPm4/7q6NyCe+
        5Ltc14NlwDrR/8UfKaEVQ6Nt8WNYVfRBNBX0ms1OSyMLdcqvXw84KR2R6lBCfgbP
        gIeBqyZDC248WAgLIz250OnjQNdRQr4+Y0keUWm7Fau3dMxrpNPgAREE5AJk0Z/6
        QJop671Kr18w4uj2Hdi+NEtqLmtH2+Knl/zYopiz9GGOVEX5+rns9I+0I58tAMcj
        IIwVxpEUV5SIAyT/cBxHTfagw0XdLjOhFBKEj8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=e2RH6O
        c3M7SvKnMtNThQnLEbeG9dZOvVUE8jjeVMZh0=; b=c8GUeNf853Fjsau2D3QXHg
        zYrgvAo43Y8xLnoXao8nTxtQ69Y7l4XDVoY0F3F3tUVfvDrRFuTH04qxZWvKvHFM
        jnto4n6pl6V7jZkKosIgGKdaZUfER0vQv8Ku58mdcnFvML1ciC68rQDJG7mjr0tO
        QR2RY/f4kIcKgHmVNx6J03hCv2B06MmpoSbVXP4N3QuUgH82nhM8phAgstQAZGEH
        EzTdUtdAeYN20SgTZMnOLEurdl5JugpFImK0+xaS1bOUzJb46Hm5T1HUgN+EDnwr
        gp4Nf1TDyCtvSzO0BTU8ecxRy8ZEUOf+fneaLylQk9Ni7SWzKgH70q6m+NxMm4QQ
        ==
X-ME-Sender: <xms:eZabX_CdCkg6L3TQuosFZpFrurI8zQCOJSkXRJqE-liAUyGp_ORGgQ>
    <xme:eZabX1j7oDftasBYTTaSHeKAh2ZNH6Ms7-LyeGiHlJwLwe0OIlRQlzrt0bT87jIkq
    qzji2Tsg_491WRZyQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrleeggdejtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
    htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
    veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:epabX6ls3E2GL_86UqcD9dVdFRLG76opy5hnBgftvDF2sNTvrAA6wg>
    <xmx:epabXxyGKS9scmgWHmPAx8UG18bM_goyiOyBN1QmZRajb7U_B6NyDg>
    <xmx:epabX0QGP4lElwXkL22IlmzaXAphbX15lPKnADoMpMHmFFP3n1DAAQ>
    <xmx:fZabXzFfG5xjkcrGWIF61d45VgeJhf62QWGSgRLhOHPOCGe_wPc-SA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 09803E00B8; Fri, 30 Oct 2020 00:28:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-530-g8da6958-fm-20201021.003-g69105b13-v35
Mime-Version: 1.0
Message-Id: <0d5e5d0a-cc74-4cb7-aed0-bb8c62661339@www.fastmail.com>
In-Reply-To: <20201027084417.10137-1-billy_tsai@aspeedtech.com>
References: <20201027084417.10137-1-billy_tsai@aspeedtech.com>
Date:   Fri, 30 Oct 2020 14:58:21 +1030
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Billy Tsai" <billy_tsai@aspeedtech.com>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "Joel Stanley" <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     BMC-SW@aspeedtech.com
Subject: Re: [PATCH] pinctrl: aspeed: Fix GPI only function problem.
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Billy,

On Tue, 27 Oct 2020, at 19:14, Billy Tsai wrote:
> Some gpio pin at aspeed soc is input only and the prefix name of these
> pin is "GPI" only. This patch fine-tune the condition of GPIO check from
> "GPIO" to "GPI".
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

I'd like it if we were a bit more specific in the commit message, and even 
better if we update the comment in the code. A quick look at the code suggests 
this issue affects GPIO banks D and E in the AST2400 and AST2500, and banks T 
and U in the AST2600.

Functionally I think the patch is fine.

Cheers,

Andrew

> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c 
> b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> index 53f3f8aec695..a2f5ede3f897 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> @@ -292,7 +292,7 @@ static bool aspeed_expr_is_gpio(const struct 
> aspeed_sig_expr *expr)
>  	 *
>  	 * expr->signal might look like "GPIOT3" in the GPIO case.
>  	 */
> -	return strncmp(expr->signal, "GPIO", 4) == 0;
> +	return strncmp(expr->signal, "GPI", 3) == 0;
>  }
>  
>  static bool aspeed_gpio_in_exprs(const struct aspeed_sig_expr **exprs)
> -- 
> 2.17.1
> 
>
