Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0235463A6D
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Nov 2021 16:42:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242306AbhK3PqJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Nov 2021 10:46:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239413AbhK3PqA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Nov 2021 10:46:00 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 160A4C06175A
        for <linux-gpio@vger.kernel.org>; Tue, 30 Nov 2021 07:42:28 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id u3so54904892lfl.2
        for <linux-gpio@vger.kernel.org>; Tue, 30 Nov 2021 07:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rbWKM9Xn2xFZwaHfEK9OEQJFZXBlU8alMZMLf++BEkY=;
        b=hNo72FJguIUw3J4//SCG1WE05GM6kn91yQQeLaGkFBRyHnRInP5JIaBXX7Jg7auqq0
         E0Fp4993Kl+eV8htXH+Vn830560XGTxmPMdXeWicmRSImFt7QHIhplsO4zdKCN4b8106
         gIAMgoE5S3IeJrlX1rqiJD4NZDbDtX6CWj7OzJHIIHtoed75dOjR5AS42OjJI1c1cGA5
         GdFIp6gVb8+ErETwzVIx67blxGjJEIcqgag+8aYwmxPIa6xs3tOHM/0CMOwvrXTpHiaO
         gSJRCsR6eaXF52pWr4AgfTVpzASpuYt890glq2JEYebV96xb+F7mJGhBEzw+Nm+jMFvg
         0vtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rbWKM9Xn2xFZwaHfEK9OEQJFZXBlU8alMZMLf++BEkY=;
        b=5M8QaPFrtBlgXvBGqxBD6w3q4dMdMNT8ehPjnqpVDSjyGkiYf3ufjI0wroBPDVaoUt
         agQh/1NcAnRqnsndzD3h51BPf9kApFc3QV8KnoIsJPLo+by4XOpplS4NI+K3DIJ6IjL1
         9LiVStiIvoGLZkzIeQCrpVLod6IjvGD8F84BVVjIId0PhDblHrXvQuKV1xwFJqKenrbu
         X44EWdO54JtBUP+zeFBKxpLAwRW02W80D+dtVq5ztyYzfWnJBst8H+87AURR5YV5T1N3
         JwnYbZ+E111SZ4Y4S2VrKcaIyAxHdyy83af+f42n+oiSFe5teycBVBUeIDH3fe5v/YOU
         3elQ==
X-Gm-Message-State: AOAM532NRzUYnJaqzgyWwd9Ho5CyJlHD/t+Iv1rz+06TrGL/lVL/cSuI
        0nfYdyfK92Hfzrb2X7wm0plk129ovj1o0ZOQS9s3Rw==
X-Google-Smtp-Source: ABdhPJxkVm8zHo+0JrioJtZwtgAfyQdYXd1nGp/UrLj5Wi3K+MS7vNAPj00qeL3DDQrtGJ7m/zhMDNmerhnM7oZ2vtg=
X-Received: by 2002:ac2:5a46:: with SMTP id r6mr4420lfn.358.1638286946279;
 Tue, 30 Nov 2021 07:42:26 -0800 (PST)
MIME-Version: 1.0
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com> <20211125211443.1150135-11-Mr.Bossman075@gmail.com>
In-Reply-To: <20211125211443.1150135-11-Mr.Bossman075@gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 30 Nov 2021 16:41:49 +0100
Message-ID: <CAPDyKFqxso-_ed4KsFO9c1M_ss65KKAPf9wYiKKOU_oLCUvzcQ@mail.gmail.com>
Subject: Re: [PATCH v3 10/13] dt-bindings: mmc: fsl-imx-esdhc: add i.MXRT
 compatible string
To:     Jesse Taube <mr.bossman075@gmail.com>
Cc:     linux-imx@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        Kernel@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com,
        stefan@agner.ch, linus.walleij@linaro.org,
        gregkh@linuxfoundation.org, arnd@arndb.de, olof@lixom.net,
        soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com,
        adrian.hunter@intel.com, jirislaby@kernel.org,
        giulio.benetti@benettiengineering.com,
        nobuhiro1.iwamatsu@toshiba.co.jp, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 25 Nov 2021 at 22:15, Jesse Taube <mr.bossman075@gmail.com> wrote:
>
> From: Jesse Taube <mr.bossman075@gmail.com>
>
> Add i.MXRT documentation for compatible string.
>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> V1->V2:
> * Nothing done
> V2->V3:
> * Rename imxrt to imxrt1050
> ---
>  Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
> index d5be9863009c..3fd6deff07f2 100644
> --- a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
> @@ -34,6 +34,7 @@ properties:
>            - fsl,imx6ull-usdhc
>            - fsl,imx7d-usdhc
>            - fsl,imx7ulp-usdhc
> +          - fsl,imxrt1050-usdhc
>            - nxp,s32g2-usdhc
>        - items:
>            - enum:
> --
> 2.34.0
>
