Return-Path: <linux-gpio+bounces-978-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCC5803884
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 16:18:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5886D1C20AA8
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 15:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 597122C19D;
	Mon,  4 Dec 2023 15:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WPtHCzg4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD8E4C0
	for <linux-gpio@vger.kernel.org>; Mon,  4 Dec 2023 07:18:20 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id 5b1f17b1804b1-40c039e9719so24657115e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 04 Dec 2023 07:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701703099; x=1702307899; darn=vger.kernel.org;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RsEmVqReDIIBR3i4Z2CPa0QYjl1YjrUYLXW2Vt7oYr4=;
        b=WPtHCzg4DLqkjb2O+ZO2bxfR8/icO6OhL6lEKeYH5aWwGF7HPUnkHJepLMZwFpO4Ky
         DlhPk+MLGi4OWFO1rIk7H2hTxIDPI99Ynh3rPqngdzjhNY8mTfgBk5bYPLVlRmVO3363
         GZP48wBEAlZrgu4oFd/k6OHnAdeoDV2WRUJx2dmPlXz2/AxOjcQGiZ1i7r5JOOJNjOci
         mN5SOBmxAq3ZSSSXb31mX0hj+jhlhj/qAto48ekExyGDlFJna2mLsOGn8ArE9zuDN7yk
         atXa9mGPaZMVMbh9FL1AaWnkMt+bFwXjL2OhU2c9pLC7UEP1idJCVRPi/MVHQIXh0cBG
         KOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701703099; x=1702307899;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RsEmVqReDIIBR3i4Z2CPa0QYjl1YjrUYLXW2Vt7oYr4=;
        b=EikvHhiZ8uDaw27k933cG8G/tyysYl2dGQTncmx4k5mdJg8wAIndfHlYAAUMnkLH3O
         WUpvRCFxxGdApaIFEWcZZdGupGGhqtg423TleJ5NKJjOeltk4CUymE50Btiq8oPHn0H1
         f7toHxzlO8VcQFKlA2TYXMjPpgTT4DRWqPKjMa6qZU8/Floz+On5UvtgMT66OvF/hSUj
         tZVIBCXBCnVEHEpDTJkbKzP+qV2Bzqv8uBjGCDSQ4/l6VR+SrtO14kb0o7HAInIp625F
         XG64bkDQ00vOK040zvw9wHLab26wEN7pIYsp72ruvmhNG3I7nrFUmuakEaKNUYq5zL7y
         5v0w==
X-Gm-Message-State: AOJu0YxwkB5HV1Mij6TbGU7sQUQYAsaxPPqWBcn+MrI+jF3uokUqOs1X
	4QLh7bNkYy2OiXI5sQ8J29YxVg==
X-Google-Smtp-Source: AGHT+IG4B+NlO+gk3Rg02QZFxTBy3g2VWTosovHo6HF5IQBKkdHE03A2H1v+GwZn031SukgDCWwPBw==
X-Received: by 2002:a05:600c:3ba4:b0:408:3f87:cba with SMTP id n36-20020a05600c3ba400b004083f870cbamr2675403wms.39.1701703099168;
        Mon, 04 Dec 2023 07:18:19 -0800 (PST)
Received: from localhost ([193.86.92.180])
        by smtp.gmail.com with ESMTPSA id v9-20020a05600c444900b0040b461550c4sm19050421wmn.42.2023.12.04.07.18.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Dec 2023 07:18:18 -0800 (PST)
From: Jiri Kosina <jkosina@suse.com>
X-Google-Original-From: Jiri Kosina <jikos@kernel.org>
Date: Mon, 4 Dec 2023 16:18:19 +0100 (CET)
To: Mario Limonciello <mario.limonciello@amd.com>
cc: Linus Walleij <linus.walleij@linaro.org>, 
    Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
    open list <linux-kernel@vger.kernel.org>, 
    Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
    "open list:HID CORE LAYER" <linux-input@vger.kernel.org>, 
    stable@vger.kernel.org, Marcus Aram <marcus+oss@oxar.nl>, 
    Mark Herbert <mark.herbert42@gmail.com>
Subject: Re: [PATCH 1/2] HID: i2c-hid: Add IDEA5002 to
 i2c_hid_acpi_blacklist[]
In-Reply-To: <20231203032431.30277-2-mario.limonciello@amd.com>
Message-ID: <nycvar.YFH.7.76.2312041617590.29220@cbobk.fhfr.pm>
References: <20231203032431.30277-1-mario.limonciello@amd.com> <20231203032431.30277-2-mario.limonciello@amd.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 2 Dec 2023, Mario Limonciello wrote:

> Users have reported problems with recent Lenovo laptops that contain
> an IDEA5002 I2C HID device. Reports include fans turning on and
> running even at idle and spurious wakeups from suspend.
> 
> Presumably in the Windows ecosystem there is an application that
> uses the HID device. Maybe that puts it into a lower power state so
> it doesn't cause spurious events.
> 
> This device doesn't serve any functional purpose in Linux as nothing
> interacts with it so blacklist it from being probed. This will
> prevent the GPIO driver from setting up the GPIO and the spurious
> interrupts and wake events will not occur.
> 
> Cc: stable@vger.kernel.org # 6.1
> Reported-and-tested-by: Marcus Aram <marcus+oss@oxar.nl>
> Reported-and-tested-by: Mark Herbert <mark.herbert42@gmail.com>
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/2812
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/hid/i2c-hid/i2c-hid-acpi.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/hid/i2c-hid/i2c-hid-acpi.c b/drivers/hid/i2c-hid/i2c-hid-acpi.c
> index ac918a9ea8d3..1b49243adb16 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-acpi.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-acpi.c
> @@ -40,6 +40,11 @@ static const struct acpi_device_id i2c_hid_acpi_blacklist[] = {
>  	 * ICN8505 controller, has a _CID of PNP0C50 but is not HID compatible.
>  	 */
>  	{ "CHPN0001" },
> +	/*
> +	 * The IDEA5002 ACPI device causes high interrupt usage and spurious
> +	 * wakeups from suspend.
> +	 */
> +	{ "IDEA5002" },

Applied to hid.git#for-6.7/upstream-fixes. Thanks,

-- 
Jiri Kosina
SUSE Labs


