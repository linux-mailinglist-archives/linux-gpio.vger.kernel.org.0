Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2261786B16
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Aug 2023 11:06:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234292AbjHXJFp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Aug 2023 05:05:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240615AbjHXJF1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Aug 2023 05:05:27 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44DC2199E
        for <linux-gpio@vger.kernel.org>; Thu, 24 Aug 2023 02:05:22 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-ccc462deca6so6282371276.0
        for <linux-gpio@vger.kernel.org>; Thu, 24 Aug 2023 02:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692867921; x=1693472721;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYgryWvnPj7R+xwNudgLtbOsnBLGlcOU0tzJHrsK2Lo=;
        b=Hdfa7++EHZToHiaS9oXnu3yB/Y1FuEoR4bZ/LWSALP2mQHfQ2DNUL7DjuXGLCrTsYC
         RPKjwPn8kelv/DTPqNP3BiqA1iNpwbV+s0jlDAJ6LbiWG6vMQeasuY9i5M2ZEzygOZ/N
         zzk1MWcCUA2s0DEb8IoSHw6i04Wm6mRUrzN9sD9PJGvot7+dBPf50q2SfSQ619jDMIVW
         fozYafszeFdHmWaiVmaOTsI7QOOjARDzg95WhmitiXVeg0L4tZKmVUHjqNOGrqrXxXjQ
         ZC36JR7rleMJur738qBvBJOIC0rmduWmw1r52A6VygEAX7qKuh4OmsXhWnbD5DP8quXD
         8cwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692867921; x=1693472721;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fYgryWvnPj7R+xwNudgLtbOsnBLGlcOU0tzJHrsK2Lo=;
        b=MHOXRpR6uMLmaPuFO7+BVvzHZAapCIR+i+ZOG7oZyoIBP2QuGZU69+reIAGUKSaptF
         KU2WKSUcw6NFBDU9NkRD2Er76DiSz3Sz73SczMhSci/kCubCGY6k3FKJs/zbCdwOdOuK
         VqCUMZ8+kX7lr/qBlrLgDyOomtzRN5gbhRpBCjdURd8rOkWv2dLtQW91xCUm9LP9dvup
         6+KiLbf8uPwOC+beSsHPkDDSCtCXdkT8YVO+rSdEBAYaqW8wU96XxjknJWxMvmsresxA
         D3UAfDz//D53moqeJNbztbxG73WShDQEXdv42HPfTrMFCTxkWvJTzAYfooQm3YEG5NDq
         /Ggg==
X-Gm-Message-State: AOJu0YxeEnPlCTppSlHl4vvZqcDHxuAOJOCLiD03zF8Z2S446I3wck8C
        wg1DVaqF4Xe3mJxHVNZ0Rq00ZrgU2lSuxYCLmIzffg==
X-Google-Smtp-Source: AGHT+IH/X3LEeujnl74Jaat/Xaeae5WCCGO9DUWfsTTjnvKwhypih3sk2anUMCtADPvVHi1I04HgNKSi/+J5+auW6B0=
X-Received: by 2002:a25:418a:0:b0:d49:5d3c:b04a with SMTP id
 o132-20020a25418a000000b00d495d3cb04amr14826250yba.11.1692867921416; Thu, 24
 Aug 2023 02:05:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230824070611.3335107-1-peng.fan@oss.nxp.com>
In-Reply-To: <20230824070611.3335107-1-peng.fan@oss.nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 24 Aug 2023 10:43:20 +0200
Message-ID: <CACRpkdYU7MRXRV3Uw1w300sdxv=9XT=P1vFFarHfpSM6BT20Hg@mail.gmail.com>
Subject: Re: [RFC] scmi: pinctrl: support i.MX9
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     oleksii_moisieiev@epam.com, sudeep.holla@arm.com,
        aisheng.dong@nxp.com, festevam@gmail.com, ping.bai@nxp.com,
        s.hauer@pengutronix.de, shawnguo@kernel.org, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 24, 2023 at 9:01=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> This patch is just to introduce i.MX support to see whether people have
> comments for the design.

Very interesting!

> The binding format:
> <mux_reg conf_reg input_reg mux_mode input_val>
> dts:
>         pinctrl_uart1: uart1grp {
>                 fsl,pins =3D <
>                         MX93_PAD_UART1_RXD__LPUART1_RX                  0=
x31e
>                         MX93_PAD_UART1_TXD__LPUART1_TX                  0=
x31e
>                 >;
>         };
>
> i.MX pinctrl not use generic pinconf, this has been agreeed by
> maintainers before.

Yes, it has historical reasons.

> So after moving to SCMI, we will still
> keep the same binding format, and i.MX SCMI firmware also use same
> format when configure registers. So we need to use i.MX specific
> dt_node_to_map function.

I thought the idea with SCMI was to abstract and hide the characteristics o=
f
the underlying hardware. I.e. the firmware is to present groups and
functions and generic config options and then the driver will use these.

This patch, it seems, creates a hybrid between the old freescale driver
and the SCMI firmware communication link where the SCMI is just a
transport mechanism to something inside SCMI that poke the same
registers that userspace could poke, if it could only access these
registers.

I.e using SCMI on this platform isn't creating any abstraction of the
pin control hardware, it is merely making things more complex and
also slower bymaking the registers only accessible from this SCMI link.

But I could have misunderstood it, so please correct me!

Yours,
Linus Walleij
