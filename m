Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B0EA482A47
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Jan 2022 07:34:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231465AbiABGeg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 2 Jan 2022 01:34:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230374AbiABGeg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 2 Jan 2022 01:34:36 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D97FBC061574
        for <linux-gpio@vger.kernel.org>; Sat,  1 Jan 2022 22:34:35 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id j11so66793617lfg.3
        for <linux-gpio@vger.kernel.org>; Sat, 01 Jan 2022 22:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MkkhGWtRXJ+s6tneHW+1NPBM8ELNNlMxQCKQEngHxD0=;
        b=ZPxZKS+HBK9LhtzE2X0Pk+7PmowfQCYq/MsjisGCry5eZLUyybwIXi9vKYZevDuqgO
         1cYmu+Bn/MlBhLMz9hAiXcpeWg7h5hwS8l1imBThACKjvJ6dXkxHk90rLyCTTdUZAWjo
         uJcuVBj5LiaY5BzKR4putn2AKSUqbzZ8xtXLYkSX6+N+Zh5FPPsU/BK3+17nmV2f9axG
         dx8ULVspau249Dg9SSO+dGNRtQftbnw7IcNCzvQ1teH6QiNRYTMF/o9/RJoiN14IgTHn
         CbRNs+ZrLE7Ua2UfehER6lD+bIHaNM+nxToCHLTTe1tN3CNxOVmsSdbzyjrFgXRhkVdj
         rwzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MkkhGWtRXJ+s6tneHW+1NPBM8ELNNlMxQCKQEngHxD0=;
        b=U227ERe8Lup3Hita5VkDzUn9mAQrIjI+Hcl8gDO7EPAagJq/4ZDo9YyHGvhnmdQYYy
         EJ9b0jN9aY3nL2+HOtOCgt/WYw0rF/xHz5wTnjEQPAdux8l845tSM6n5YkcQNNaT9j2L
         8ILWXJL/d+7sKOvSL2x885k/PS4odsYQZfoSx3iZdD2kSJs0CIx5e+mvPvqsdqK1TGTR
         4zOLHYOOw8mYSktmgiwAcdnGnOP1ov7gSidYPVJ8H8A5nwikFy1zzhn/fSVs1AhgjynN
         rXL9k7N8fIifpmBJtewg0Xm0RHGfyCYKO8FiZbWUHBgo7xLqGnPgCEaTpzl7TFp9eZli
         5qJQ==
X-Gm-Message-State: AOAM530QikL5tuqnM7KXtrkdXey/HDlDN2VutPoZ89HL7G3wjE4JzWMG
        MVcQOUNGVDAZoDP8FgU9gImHOz8I4fmAKcrp5lGkEg==
X-Google-Smtp-Source: ABdhPJyAXf6tOqco4h3bq8cESjf4rT9k6XdAEU/lifxuzNRUtH/WYHyPTmFwBNPn7Vb1baZhiR3xcONm2SA2EVvf6CU=
X-Received: by 2002:a05:6512:118d:: with SMTP id g13mr36303466lfr.591.1641105274195;
 Sat, 01 Jan 2022 22:34:34 -0800 (PST)
MIME-Version: 1.0
References: <20211227122237.6363-1-zajec5@gmail.com>
In-Reply-To: <20211227122237.6363-1-zajec5@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 2 Jan 2022 07:34:21 +0100
Message-ID: <CACRpkdbvZ+fZoGsVDY+kNEo4FFTUwJbfAq6ciC+mJN03Mm2jvQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: imx: fix assigning groups names
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 27, 2021 at 1:23 PM Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> =
wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> This fixes regression caused by incorrect array indexing.
>
> Reported-by: Fabio Estevam <festevam@gmail.com>
> Fixes: 02f117134952 ("pinctrl: imx: prepare for making "group_names" in "=
function_desc" const")
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

Patch applied!

Yours,
Linus Walleij
