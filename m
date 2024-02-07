Return-Path: <linux-gpio+bounces-3047-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFA984C8E8
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Feb 2024 11:47:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E26461F233AF
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Feb 2024 10:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00CBB168DA;
	Wed,  7 Feb 2024 10:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rpuXomQM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238E017BB5
	for <linux-gpio@vger.kernel.org>; Wed,  7 Feb 2024 10:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707302812; cv=none; b=lDzaI7b84fRPjR7So0Hv62efjD89XvUxDYHvs/JXk32BEMvmmnVHKzgUM+w4/aY2YQfRnKQC97bY1YTz3P3EaAZEDvi2FB7l4qAnOzKm+TMyqTpoPRnWguIHZ0VE1vcL9mrjI+Gru87fmHxK9GeeZCEN1drN5ncOV/B7gGSoWic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707302812; c=relaxed/simple;
	bh=VKj881Aaf4mYKxSOVReOB5rnt8T7gInv+xnCpX24PSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mkbZwGWgIMwtDhRodpnM1+Voi+cYEGjLutHAsOcwJ5/IlEPyhM/2XVVnkYuNWBzhFRpiaMrcLsaDXw+A14Dm7fxFlAYYx6h0s2yn6IAiHW/R5dYwN7C/RUANOe6ntloLwh56rhqmbX658pVp01yTSLANlLlvVgH8uZTWA990Gw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rpuXomQM; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-60491b1fdeaso3935657b3.3
        for <linux-gpio@vger.kernel.org>; Wed, 07 Feb 2024 02:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707302810; x=1707907610; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VKj881Aaf4mYKxSOVReOB5rnt8T7gInv+xnCpX24PSM=;
        b=rpuXomQMIAfp2RfA9kLzOdI5FPOF4CDY3nGI9VAjNsiiK+SI30rCOf48zqzObLrWrG
         //85ktCU0cmAnrAPUuIqqAAvIiaWLEF99maQiyXSEl3Fk0GiobnmXR7N5A9uCtOu1I2X
         i+nIqYNIwA45CZoF5VmraDR8CLphTtZp+ufB+++ZXU2DGXx+OKbZJQNaR+WFnIL5S7I1
         evYs7OTtxKxfpT5sZy3rZ158AgcWHzFH+Fr1zjVBo2qhG49E7HKneAiTSjRS/VDLv/a9
         A8/Kq2a3MulsDkg7q5N4DUiAJo12TIuyo2b0tVoHo3sJj3e8C+SQbtwh/+qiH7bF0iai
         q3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707302810; x=1707907610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VKj881Aaf4mYKxSOVReOB5rnt8T7gInv+xnCpX24PSM=;
        b=J1g96qvURivF+6pGFnhtL5FgbHvOsYkCOlNcrSLwZ8OCzJqTUppgII3QXrNtY5/Kqq
         7K8HTZIdYfFxnC2hupKHOVArX7iG1OXSUaQcHn+Cg+RI/ltDv0kFbPBTACceGSH8POv2
         vQsVb5j3irz90Ad1CYNLO/vfWZMmJ/WMiWZ6/VvCL2JzcUH7LKDs/gbuJDyfMhFclaDG
         ISuA0q9/Jx1KY6SAymK6r2ooWGSmXYiiuylQh2EZk3CAyk01ElIzZE+t1pyTcJPIikXs
         /Gg1z8z6F1yB974JDit0hZ1Bo1WiYn3zySCzquOxDoDc3sAuf5mIebt5le4i+v9ieWOL
         UsRA==
X-Gm-Message-State: AOJu0Yy8bFGX9a32tY592jZPd0SIHqUhoGg1/B1mIaPPRuKCnLrAPCuL
	siyqzjEvnM68L1zm73MJVBeXHpYgVh7mF+vTRAdGfEVKop5RnKpCTFGATO5iImAFN9sz7Te0MXH
	6zXCS28s4CessePPDUfmDyrS0ghrBmMuo//kkaM3BInfdknX23Nw=
X-Google-Smtp-Source: AGHT+IFICaMWcFSHf+rMsrZpjqNCWw5NlgzTK1CiqqBvfuK2Ztc7Bl1sYVhPZ349FbFC6VpKk9kRIE5qv62ianruFtU=
X-Received: by 2002:a81:c709:0:b0:5ff:314a:99c with SMTP id
 m9-20020a81c709000000b005ff314a099cmr4376710ywi.5.1707302810126; Wed, 07 Feb
 2024 02:46:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231211154239.4190429-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231211154239.4190429-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 7 Feb 2024 11:47:03 +0100
Message-ID: <CACRpkdb-F_UkO-taK2Cqt-OkqWaTy3mp+YwiXxE0uMFad=D6+w@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: nuvoton: Constify wpcm450_groups
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 4:42=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> There is no modifications are assumed for wpcm450_groups. Constify it.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied, thanks for reminding me, I must have missed it.

Yours,
Linus Walleij

