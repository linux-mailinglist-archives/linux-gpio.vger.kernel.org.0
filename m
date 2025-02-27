Return-Path: <linux-gpio+bounces-16746-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E661A48CCC
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 00:31:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 969E51887AD6
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 23:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B75EE276D25;
	Thu, 27 Feb 2025 23:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sR5ay0+J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6ED8ECF
	for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 23:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740699073; cv=none; b=SnAiD2Qapi4hfAL4vHZ7+JOQ9xKyYJ2MBhsthSP9esuMF5wc9xRFyns7TN2ldNpvG7Pf7AAxfoGV/l5LIqkU6PbY5Orf/zjXJBbT88UmNiaW8VLnoEJD7PKcnuQk7BRnjHx3o8SybtE+/Y95wxDi7yPxNV/aFfNi54rdBJdwAwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740699073; c=relaxed/simple;
	bh=IaHRDLSMhNHQ5jw1EyNdC2cl6TQcuWJ21bMzGALrB1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Js4VTJZNtE6DJRWghoUBivqp2bpo0tRBR7Jt2B2hsALq7cdPDJXZtv65ZnbXtn51LYWVRzIYkRzfpqr13Gc2NIV669aq5J+IAdoi1nWjDK8n5e6SiVxcEVXoEr1bODOCejh9NO0gjUlMurQhAAhCXEbFEskIjX5zSNSzs/5+hfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sR5ay0+J; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-548409cd2a8so1515495e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 15:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740699069; x=1741303869; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IaHRDLSMhNHQ5jw1EyNdC2cl6TQcuWJ21bMzGALrB1A=;
        b=sR5ay0+JNhvbBswcLqMse/f7aDgpyDtkeBkz9Gr99AMVIdjsI+3PliB01LPn3KaaWf
         kdnQYZhZnkKcK1yv1DyyRjTS19xkSfYrhx13AxT/8eLlt+jcx7n7A2U/5F14CyJWCXOV
         MLXpiHcSYBuuPGqJ4Zcb8XyDnaxuvgmGRZLTPfnydR1Eo7DQLa/gozaIXOfJPloPLlMq
         3mpI66s6i/i/IMr59C1ilJHWfdLVE1fju46LPjTLEihpPVnKtkczXPvyknj41dgNIJ3n
         C2V/QXCEqVMwLmYfCcYBCq5cdVwYLRdWAodVKaCDsQIXeLm69zINTkBOat8Ijlp63LKg
         9V7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740699069; x=1741303869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IaHRDLSMhNHQ5jw1EyNdC2cl6TQcuWJ21bMzGALrB1A=;
        b=k+XLciWye7V71ZxHZFe8ZJWoz5cvr8+HEQnMPM4HCZPROWf5kK/PR3/yENTkphjQtE
         v5784FwvCSuGkAPqbRhpKgMok0F5yKV8c12sASCrA5M/bRBZJkK7m6Xphv53yrk+8Nc/
         JIvnCxwbNoRRJmCnPW6WzifEzBacZxgMUQ9cwqCVpC4FeW6Rt50cw0I5uF8MUEh1hoSr
         ET8059gSMH3HgejyKKctwloTgcDCiu5Uec/NKl1uqrpNSxM2si/kgpGPrmewFXBsdCgM
         G1qN3hLLZ4Ern95VipQEwB8yFqZksGcBTPZp13oX1n/zpr9C1T1OtBZ80wtwpMEtUziA
         c3gg==
X-Forwarded-Encrypted: i=1; AJvYcCV/nz6Kk/Zx8qZsXhC98L3pcR7/TC7hog7KKfl6JWZ/BTksNi2macipi+yWb19mswJq/4WXCEoOX1nT@vger.kernel.org
X-Gm-Message-State: AOJu0YzQvYDKtLyuNfbCSwA4zRLjHsAqxkBOwcAqxCYidEfjoNSBulCC
	hRy4NF3C6V6EZpnuMUEk+c2ThSkHWP172DlRHGJp7J3DbnQ388nRXf9SqpwK41xYarzWdLmQBuK
	xLQbzuuvAEP+ZE1PFM9kXbBnc48vafN486lOvog==
X-Gm-Gg: ASbGncuWdIGz/JMhJb2mQDGNqVClAm1towAHAB9nkaCskYWYSG42aRFqtK0BeiJAZ0W
	jj5GswYxGdtb1TVvflMPva2N9k0N5Q6UIflzuMxEOM9L8qWgNR0co3QhB+w70gGrtDpSLEyCrsm
	cQzSmVNfU=
X-Google-Smtp-Source: AGHT+IGGbs1UVyEgAcakRDFXIeGYBdUxdhWfag9rAL0rT+OgOPNIr+4bssP7UEerjkTRNMc7dyVEUpBQezVs8eLvUok=
X-Received: by 2002:a05:6512:398e:b0:548:91f6:4328 with SMTP id
 2adb3069b0e04-5494c11b516mr580710e87.15.1740699069023; Thu, 27 Feb 2025
 15:31:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250220155036.2734838-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250220155036.2734838-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Feb 2025 00:30:58 +0100
X-Gm-Features: AQ5f1JpjkmaOs8rnxPzvRgfLNG60MoCpF2hC66NOqkW8z94ycu4HgaelFf-UG3c
Message-ID: <CACRpkdY1tgHQyU+s8HxfW=rK8bFfFsbz=Pa4EukOrNvC++4=0w@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] pinctrl: wpcm450: Switch to use
 for_each_gpiochip_node() helper
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: =?UTF-8?B?Si4gTmV1c2Now6RmZXI=?= <j.ne@posteo.net>, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2025 at 4:50=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Switch the code to use for_each_gpiochip_node() helper.
>
> While at it, correct header inclusion as device property APIs
> are provided in property.h.
>
> Reviewed-by: J. Neusch=C3=A4fer <j.ne@posteo.net>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied!

Yours,
Linus Walleij

