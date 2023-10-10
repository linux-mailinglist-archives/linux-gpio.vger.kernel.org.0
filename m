Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E45B7BF9FB
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Oct 2023 13:42:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231430AbjJJLmQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Oct 2023 07:42:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231401AbjJJLmP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Oct 2023 07:42:15 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A71199
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 04:42:14 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5a7c95b8d14so3018217b3.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 04:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696938133; x=1697542933; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wECZ5jwKeT3uLF3SPG8Gcvy1zVNHLgGjwE0iil9pDlM=;
        b=Nhzo1pKUmPSMd5lE5aqJIyEB/WVxSyMrNC2BkRpMIpI4+A+FD4NcXsK9TzcfJfaqeD
         id35mFMlTFbqHz+jMyt/FdtkRaQK59zoCrjytovjAnfz+eoRQkR55b8qw00qHXx7EKFa
         ZPuz/y/wm07zLqLNn+Zg4b4OCvu3w8r8pwNwPQKHR9zndYUDoyIuf4aLM0ljGEuHAkwX
         GRdRBDq2hp3T/igjbsItZ/ik4HxWLeZbBP2Alq1fOqMgwMjxI4RblIyHUSDzcrKgl4sG
         woyBO2gBLQI8ph8n1W9BhpSureudcuNV04Z8fP9w1zIkb7pWJHq5//eYbXmUw2iK/b/M
         t4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696938133; x=1697542933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wECZ5jwKeT3uLF3SPG8Gcvy1zVNHLgGjwE0iil9pDlM=;
        b=EtECgirhyAe5nWGgEZ1u3WzP1YKNMBaAkhPzFVBJv+46o+nRTcpAZmrlDABHY+7UgZ
         AF/4Cf8JYMvsX/Kuo/433fH8WgasQS3vsWHTZH9bkfvBfs20teE7/aLicj+c6JLrboV1
         6xWq2C2h2o8UxlKvNH6VO5Lim/L0QMKeEzGM3D1LSmSnuQFZdIK2MxkkOzi2iLPcnz9O
         WTQbeUgxyamKZ3hy90f2TU4P9J7cV7MzErdafy+SvkvNidCJObwLLZ7S6Y6VHggoc5SW
         rzaBJND30oqEqvhvcBsLLUnnvbpY1sdBHfiEQIDh1KF11DTS8lKYMz6YXJtEL4p7Tw5Z
         8pTQ==
X-Gm-Message-State: AOJu0YyLgKrEjET+IuzfM2C7+3EmfsgO5FXfL13vvHz5/5UalYazCyAn
        8Pt12DKuW6D83d6KZZCH2YXlcIJtUpDeeJCf1DT5og==
X-Google-Smtp-Source: AGHT+IE4n/iGQ2sV9c6suZvu2EEAgFCAuiatRIMEGKd/KYttwfGWzxwtFAhkJyvc1Rvk7RdIelsJjF2svJAbfLHOhgM=
X-Received: by 2002:a81:7b8a:0:b0:59b:c805:de60 with SMTP id
 w132-20020a817b8a000000b0059bc805de60mr17432611ywc.45.1696938132846; Tue, 10
 Oct 2023 04:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230928134321.438547-1-festevam@gmail.com>
In-Reply-To: <20230928134321.438547-1-festevam@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Oct 2023 13:42:01 +0200
Message-ID: <CACRpkdaYUVEd3J=cX7tbvzhWK2TOO72FOecUU2ZFdw-sN2GMMQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mxs: Remove undocumented 'fsl,mxs-gpio' property
To:     Fabio Estevam <festevam@gmail.com>
Cc:     aisheng.dong@nxp.com, ping.bai@nxp.com, linux-gpio@vger.kernel.org,
        Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 28, 2023 at 3:43=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:


> From: Fabio Estevam <festevam@denx.de>
>
> The 'fsl,mxs-gpio' property is not documented in gpio-mxs.yaml, but
> the imx23 and imx28 dtsi describe the gpios as:
>
> compatible =3D "fsl,imx28-gpio", "fsl,mxs-gpio";
>
> This gives schema warnings like:
>
> imx28-cfa10037.dtb: pinctrl@80018000: gpio@0:compatible: ['fsl,imx28-gpio=
', 'fsl,mxs-gpio'] is too long
>         from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml=
#
>
> "fsl,mxs-gpio" is only used inside pinctrl-mxs, but can be removed if
> the compatible check is done against fsl,imx23-gpio and fsl,imx28-gpio.
>
> Introduce is_mxs_gpio() and remove the need for "fsl,mxs-gpio".
>
> Tested on a imx28-evk.
>
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Patch applied.

Yours,
Linus Walleij
