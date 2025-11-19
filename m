Return-Path: <linux-gpio+bounces-28743-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CC0C6E2D7
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 12:16:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D8A9D355233
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 11:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E057352FA3;
	Wed, 19 Nov 2025 11:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AJ93164d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5AE3321BC
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 11:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763550387; cv=none; b=nXM16cL4x34Y+o11boNflKzajcB7wQ/GczCGN1yv1AviX8VPBtPpDjCm+GQVq1JCGe1tnN3Cv38UUpgfJbD8k9B9yhHcFSTOPOVuurFlO05AxOmlvVJkf8E+BPME4Wz1Zj6nfRjZ3htQV+OxCg0ngwYy4RvfB3LN0rlV/5JbEjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763550387; c=relaxed/simple;
	bh=NxRHBvmhBNy0u0ARSVXMJmHRZdZL/TXaEXR831k4zAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KD6ipWQBocgxc91ZmAskSgmjfmpOQrvrO89dSFhgCsFXMnzWdKs0hIzXxbAmLyQmASq+Ngk8DeRJcw0ABeDQTaQX0vRxEczbjfrRF0lR1lExrCBafeiQOV6y2CcNRvFwvaq+r+RUaJ3BUBcOEVnKgJYBT/ckeI5NA7SJBKe6QPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AJ93164d; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-297d4ac44fbso5696225ad.0
        for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 03:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763550385; x=1764155185; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8YuhWF3HD+vwBnfM+I0OX4Ic78IWql3v0gIt+QlEwX0=;
        b=AJ93164dbJ1dfsmF5hTUr7rog89vhep7NK2g4u/uBgOYHDkdnQ8YxU+oVSe4Voj5Xw
         BIicUOa2y5FutIs/5/ju+lBgQKMPc3qMnzowjpG0zzUzjSlI35VeSKKyHfo9vBcp1pt9
         5BvglaOefb3/gqWFGbXRbi7pRXAxK/zgBQlcPWUDf7yB1CX1FbsSQ9Ynnv12aRBnGebL
         2GDmlSVHZQ3QhGLoA2knpiAVkOtqmRcv9AGULnp+jM02kWQVy1pZQUJt0kaKeV65y4TI
         lqrFHo2j/PP/0xLirCnhEwkMESfcVcoTcAAj04LEmxticrT8sBw34zMw0EafL2PDGDdR
         XUaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763550385; x=1764155185;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8YuhWF3HD+vwBnfM+I0OX4Ic78IWql3v0gIt+QlEwX0=;
        b=o/nPQkbH10aIbG+6tb4sBzMH+UdH3T+DidErXz3lA2yibC2s609Q+TUwYDi9E1jJV+
         ErpRjhGzZsdUdd2omu7anzKsR3r97DIfB6KEd4WGbExCrNbPy6Dz1Ux/+N6w9gA3xMfA
         yKoOcB2LBiarELt63xNM2HZQJJlqMXsbTJFK+EkhfyuigMzf4fm2JVRu4hSIWRWEGRvK
         0U10Bg6JNJAix4pcAnPmzS+Wnk97zJVuqCy81Pz58XUvpO0PBPRJib7P/PKdN9FvO+CX
         Is2GD0hOE7eeoO+NipJE6FpBkJXgiefL3ZFbFqFseZo3hIDcEGqwp2mKcyQfxatlCaL5
         svAg==
X-Forwarded-Encrypted: i=1; AJvYcCVR+8hadKXUJOJZIVJNF9IUMd3al7L46baV9H+bB2d/J/H/bm/sGz1yeo0TzBADC4UX9M88ZTnRrxyu@vger.kernel.org
X-Gm-Message-State: AOJu0YzTMuEJfDQ1gWvxJoCh1ETt6wDrwO3xzbvDcCpCt9ZdgOMszthR
	5VnJmAW4QxoeUTTQU/Wc24LAS/DVTQ9VfiUNAJ6pOF/jCbAHTAVOGo5t
X-Gm-Gg: ASbGnct7NFVgVBzBOglE6AAxUhPufv4Ws/jhQF1EcbZ+7S2Nwmqjjj458TgzrG9vJjT
	WiFBc/3O3DskZgyS7fToUWSpfPC+69/Q4DEtt4Kigrvio/k18c5YRRNBc617p/rkrCbAXM4U0dK
	Dfn4RIUFOhhFs53CLmcLoSVcLfkMmeZgNF0JQzBqRqClUzZivv7QQlpWmY8St4DhOJ8DBD62cSW
	XNOwYtAurljPYhZjm1jA8Hb+eJ8TkJWuTJgmYZhx+/+lbgJxTepgaFLH1Jhu20gVjF3m56EPCxS
	Pll91gPM3ztn5EcZVwG6W4I9+YpzhATznAy5cRHXKL6A9cqQG0VjNuwHHrGmn0257rgpAcC2FUm
	JilDBPg0vSvSH5VZsHV6AxC2DKZKs++3Nu3qzquYLKAoUQWNtC0aed+xnoi4xnVopDKAq8+C9ui
	UqrNt2OqndfopxSUH5Ww==
X-Google-Smtp-Source: AGHT+IH50all20trXpBdSJ7R7Sw4Uwv+WJ2AA2lxSbaPJ/o3j7wljJttlmySgXviAjfj8jKijFfhjA==
X-Received: by 2002:a17:903:1a84:b0:25c:43f7:7e40 with SMTP id d9443c01a7336-29a061ffff1mr26440615ad.10.1763550384797;
        Wed, 19 Nov 2025 03:06:24 -0800 (PST)
Received: from [192.168.1.50] ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b0c92sm204805405ad.69.2025.11.19.03.06.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 03:06:24 -0800 (PST)
Message-ID: <1cb2ece2-9175-480b-acc0-bd1cd3bf2327@gmail.com>
Date: Wed, 19 Nov 2025 18:06:17 +0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] Documentation: gpio: Add a compatibility and
 feature list for PCA953x
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: =?UTF-8?Q?Levente_R=C3=A9v=C3=A9sz?= <levente.revesz@eilabs.com>,
 linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>
References: <20251112224924.2091880-1-andriy.shevchenko@linux.intel.com>
 <aRfWouKGA7q2ufCV@archie.me> <aRzBGhsLA_s1rJbM@smile.fi.intel.com>
 <CAMRc=Mci_jEp-8TW9+hAyb=viMy69SXDSE99k0Rsss_0b7ZY1w@mail.gmail.com>
 <aR2Jqrjb5dN9LeWq@smile.fi.intel.com>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <aR2Jqrjb5dN9LeWq@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/25 16:11, Andy Shevchenko wrote:
> On Wed, Nov 19, 2025 at 08:51:54AM +0100, Bartosz Golaszewski wrote:
>> Is there anything else to address or is it good to go?
> 
> I believe it's good to go, as per last Bagas' email (as I read it). In any case
> it's documentation and can be amended in-tree.
> 

Hence:

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

-- 
An old man doll... just what I always wanted! - Clara

