Return-Path: <linux-gpio+bounces-19698-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0879AACC23
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 19:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 013BD1C03DCA
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 17:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6961127F73D;
	Tue,  6 May 2025 17:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hlk4tAXJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDFA2475C7
	for <linux-gpio@vger.kernel.org>; Tue,  6 May 2025 17:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746552205; cv=none; b=OzizkCFMym/zBCPgDmr1C5Xo2z9d7kb+if48DGE9V1ClXdCf6HefUWmvJXMndnNrlD1gpn8ZbKIoFArxLadKaZMUa5w4WD2xPoFSrIPDPr6NM5c2nXRPYDFztfL6pfGAbnVNg0QYOBISWuq99FsoCQYlVwqt1+fkcQWbTlwXe0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746552205; c=relaxed/simple;
	bh=fJVuLvipZaODLDOPSHa5k8oaRgCbH6Lmgvt9FeaV11A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YzM6VDq+tappGILecYQsO/QDt8037RHL1WafxxT1ZdXgm2qa3/Bi1V3kzUJx1iPEz9jrxL+WgCvE5tdjBxAa/EB9ho+/mXz4POdRYaJgt3en+gy3FPS3OvbCC/JPVERdnRnlboZhV9bQi1JJxV4Blg0A10v23p1wGfJxMaDsd8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hlk4tAXJ; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-acacb8743a7so17304666b.1
        for <linux-gpio@vger.kernel.org>; Tue, 06 May 2025 10:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746552201; x=1747157001; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CH+3YE8oQ2hbQKxa7VI83wPBVwlMSC91rnq+CEtI5/8=;
        b=Hlk4tAXJn2BqNfqtd8DkGZ6135dFLh+IEoNVVirED6/ojVoACWiWuTNY8suPfF2sLZ
         s+LRgXn5bpBBXv0fXe4A7cqCSyugDFhYXi8zllDMkKmxji+sUh4TdOnGbj7al/Zi6oUt
         rQQu4934vzqmWlxavoWBTCWuQT6RbVgYwZd0yO/X9cbvlUUCVNIm3vPqoKRf5fY0IkpR
         PTICC6qt730QQ014iZSK0SpaZD5z6x+tnsyEHgJSl6s1TBsMFmgW8/6AJHw6KiIaU/oa
         +Ee1MwfzW/I0NrAuWtUdMm/Bdz4yDmsfrU/gMuTYZx1xP3MlTJcMik9j/tJuZzu5Mie1
         esOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746552201; x=1747157001;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CH+3YE8oQ2hbQKxa7VI83wPBVwlMSC91rnq+CEtI5/8=;
        b=TcxiYbooVZDLLdbA9i/IHKGvtdAPQs6KWmFsJKVZCb8RcbYkCuHwNuAstwHo58v19g
         xbFsoJzdm+kP0TD+QdfzoXL731O5QvrSK/6xDWDAvfl01BEMj6W5t/VJt0y+QTQuu9Ke
         ZiJyOYQ41o+xoy8wY/RwZgZqvJTMVvQca4pwCRruxPYFsgRr3G1ILb6J5H3OUmI8fRbR
         XG7EyQb5LmI5hb8bASv0nwbwEvRmkT+/u/LbsDvqf8mmZ0Pf35w0fpjv0O4/6WYB0o7Y
         MYj1jPJkfc5EEqKIVWX4t5ZpGKimi0nyCKpC3K2wSjeXxoeKgy2jzIDcf/g1oBAqSUvJ
         F9Uw==
X-Forwarded-Encrypted: i=1; AJvYcCXDEgE3PXtZp6f9hjX9PHroMlDHXwxd43sPqtMcNBusr8JB1QgZGzGjJUqL/h0N85URggng6XCKWi8y@vger.kernel.org
X-Gm-Message-State: AOJu0YzTuodoEWAgydMFn6bii8QhGDmIy6pGAHeZcdygCtAdGaxJKuyO
	1MIVZzagqW/3ya/P811o6ws50SWk2mDvaYS9U7itYqWU49UMtSyygXCoEj7+URl3mSFZ4so9ioq
	bKafmiLnQBquXrLtWosVR/mSaxbbLm6InUMZg8A==
X-Gm-Gg: ASbGncuT7Geg6WWzKrumwgVBhkDugZ1KVzWAeHUZHdnuGO8nQq3gZ4sNB21kiLBuPUg
	NkFx1UK52h505arFVwpKKu439F+HhFPBTdrfKLdT3NiUqytvub65tgRgcpDiv2+yaK63J9t0z7R
	esHJ37meAkMBiXSdSzo61H+maHDYvNY/5xz8lp/7jPg35TkJEzXi5u8g==
X-Google-Smtp-Source: AGHT+IFnrJNrgy1m/oRww7px8z7UAiAL/GjQDOBzHgoOoLO675fM7OGX500WyhrjcbjscragoGRNgo+LSuwB+tFMAUw=
X-Received: by 2002:a17:906:c10d:b0:ad1:8dd5:e69a with SMTP id
 a640c23a62f3a-ad1e7948a11mr58747966b.20.1746552201542; Tue, 06 May 2025
 10:23:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250503-pinctrl-msm-fix-v1-0-da9b7f6408f4@oss.qualcomm.com>
 <20250503-pinctrl-msm-fix-v1-3-da9b7f6408f4@oss.qualcomm.com> <CACMJSesbNz1Q5S4EDDk_O+oUfw8c6MQdovUAA_q2EZzuG2+i4Q@mail.gmail.com>
In-Reply-To: <CACMJSesbNz1Q5S4EDDk_O+oUfw8c6MQdovUAA_q2EZzuG2+i4Q@mail.gmail.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Tue, 6 May 2025 19:23:10 +0200
X-Gm-Features: ATxdqUHOS3jqOuPdOa1ceB9XoLev0t0jfeVU0XwwsL27s3_XDnEK-YfaAN-y_GE
Message-ID: <CACMJSeuRDNo6Si+U-ACCgGnmW5H=D7Bcf32hqxxaLObt+_geew@mail.gmail.com>
Subject: Re: [PATCH 3/4] pinctrl: qcom: switch to devm_gpiochip_add_data()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Guenter Roeck <linux@roeck-us.net>, Josh Cartwright <joshc@codeaurora.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Doug Anderson <dianders@chromium.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 May 2025 at 19:18, Bartosz Golaszewski
<bartosz.golaszewski@linaro.org> wrote:
>
> On Sat, 3 May 2025 at 07:32, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > In order to simplify cleanup actions, use devres-enabled version of
> > gpiochip_add_data().
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/pinctrl/qcom/pinctrl-msm.c | 6 +-----
> >  1 file changed, 1 insertion(+), 5 deletions(-)
> >
> > diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> > index 88dd462516c76d58b43d49accbddeea38af8f1ec..b2e8f7b3f3e3d5d232b2bd60e5cace62b21ffb03 100644
> > --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> > +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> > @@ -1449,7 +1449,7 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
> >         girq->handler = handle_bad_irq;
> >         girq->parents[0] = pctrl->irq;
> >
> > -       ret = gpiochip_add_data(&pctrl->chip, pctrl);
> > +       ret = devm_gpiochip_add_data(pctrl->dev, &pctrl->chip, pctrl);
> >         if (ret) {
> >                 dev_err(pctrl->dev, "Failed register gpiochip\n");
> >                 return ret;
> > @@ -1470,7 +1470,6 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
> >                         dev_name(pctrl->dev), 0, 0, chip->ngpio);
> >                 if (ret) {
> >                         dev_err(pctrl->dev, "Failed to add pin range\n");
> > -                       gpiochip_remove(&pctrl->chip);
> >                         return ret;
> >                 }
> >         }
> > @@ -1608,9 +1607,6 @@ EXPORT_SYMBOL(msm_pinctrl_probe);
> >
> >  void msm_pinctrl_remove(struct platform_device *pdev)
> >  {
> > -       struct msm_pinctrl *pctrl = platform_get_drvdata(pdev);
> > -
> > -       gpiochip_remove(&pctrl->chip);
> >  }
> >  EXPORT_SYMBOL(msm_pinctrl_remove);
> >
> >
> > --
> > 2.39.5
> >
>
> If you're at it then why not remove this function here and the
> callback assignment throughout the pinctrl/qcom/ directory?
>
> Bart

Ah, it's in the next patch. I'd make it one commit though, no reason
to split it IMO.

Bartosz

