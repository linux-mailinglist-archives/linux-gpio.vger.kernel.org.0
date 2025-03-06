Return-Path: <linux-gpio+bounces-17201-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B309BA558B1
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 22:24:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18281189877E
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 21:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0817E213253;
	Thu,  6 Mar 2025 21:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wXFkWud3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F0B1A3176
	for <linux-gpio@vger.kernel.org>; Thu,  6 Mar 2025 21:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741296285; cv=none; b=IOf8vvwPcfNS3uoVZMabA4bGNn4Iu9ecpa9I4g7f+L5hmhtrfSRyMVbsXrb8DYywBeeitGBhPC1lTk5VMchkqsFnHB9s9U2JZMTcgmnMsB21h5XSQ/6+BWSUWD8BSUxAGcqXfqdzY1/+pGb11V7VB6UnwwY/qdgfe3RGMC311bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741296285; c=relaxed/simple;
	bh=jTLuvp354LUCFBEjUn6vv/C+4kNgg7zXepR1kdOwbgE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L8Alz2mran1sOQaPzNtVtikGWZMlDkmCw6Yx6n6R+9z2XlYdsGOixEj0XhhHDqcK0WPHg0ARCCbIy3V1Jx45IoI2XEeoXsUJq5BJJSoHCO61R1f6c/+j0Ht+GnGmmm5fwm33yBbOYdeBj22eMet2ifrVGtrDwjBl+DMdoU4WkU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wXFkWud3; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e52c1c3599so1790594a12.2
        for <linux-gpio@vger.kernel.org>; Thu, 06 Mar 2025 13:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741296282; x=1741901082; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jTLuvp354LUCFBEjUn6vv/C+4kNgg7zXepR1kdOwbgE=;
        b=wXFkWud3PhfIWlUy5fkzJEOwlrZDkNnaB6YGUEge+KOvt6ZjwSSQrEy7pjBRDjQred
         R5ETq5KqXPFgxNLDzVdkQAuF3/oZQBfSGRO9MTQmlQ/tCHoeWkxNCALwR1HvQzu2Pkqv
         YAhfI93Fp3FG6B3vquZHZgfDcLk+oNUGmyRbudeArjG4VbGNy3cefzwQ3FQ1OVkE7MMa
         PkJzk6mmU79jTzxGgVV7/X+7a8kMsYLWEGaKUbcWnldtPrjVWQi4FbchKBU9OUjJZlhb
         SPbB83aZQXhviYubX8NMVq9y9HG3x8QXdonxI6H6PN1m4D3EX4Q8+jFPf8JN89cg2vpp
         KfEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741296282; x=1741901082;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jTLuvp354LUCFBEjUn6vv/C+4kNgg7zXepR1kdOwbgE=;
        b=cYOXj8HR/0vz+56zO0lSUa2SPanc7XXOz1j/aymKxGQxfXWUvql/QzQ3pN+82gSJpB
         PWM/Yt+6KVsjxqaF75eCVCfCFGH3mnbHpC/31Lcp7imAleUSjGkjcDZtNH3a0DurSPHM
         bHkaZ14sZZ2ZAJqcgm0Dmzcx2ZiPrYqVBONz0MoS25a2ekPsH+8bqDjfPSJN74fPw7zC
         y+3HhQ2Fp06bmdHEtLA8JKpYpLs/9I2hCUFfIoh8rMripdBSYGYkPPBm0eiNCt4aFmJ/
         DcDYZPj3qAlLcbhg2XqP0HzkPxNsCPCOKXio5byHD82AlH2DPbE8ZZrKs9/+/tE669Gz
         Jqhg==
X-Forwarded-Encrypted: i=1; AJvYcCUS6qtI9MkElA/k+3nvO/Ryw+SBteL65LTSe6M5xbvUFtPGvzndmOBtVssDt1xfQlvWg7En1vx3MPpY@vger.kernel.org
X-Gm-Message-State: AOJu0YzOia8foGWZr8Y3/CJsg/aNKkj1jJEwt2gCw3b50hEbqGe7n7vG
	qMCkBeQaIRlgS2/DVT8hIGYxFetkb5edMG7OLI0v/z3HLUANWAx6UjwVZiu9mgV93C/FwXB2XTo
	M3Y/tBg==
X-Gm-Gg: ASbGncuWyxcbvnWLjFxl7+X/4dW1z0WC+ecskW3Afr0ItURXT7944zCWGUNMjSy2ArV
	+TFpUGpxP89I2VOWwwh8OsOB6DlCiS1z5es43Me6qMhO/+dSm8maN+yE9mgjcysVfJ6rPeS53L5
	4N1URjv+VdkXA0thPoaciQ96SR9256FHSLm2f+Sqr0RaZmYPhJKODrxwx7Jj70f/puHUm3mIGvY
	ggK8a5dG2TlfszIhYF2sOm2oR8ZM33b/gRBg39U4JdM1eRb60AZGYr2r40ANJPcl5fugFLFTwgx
	75J7B7gajzo2NEV2b0P5SiRCGvprYEeBpNRp4EVbDvCP+oU=
X-Google-Smtp-Source: AGHT+IFGoQqzB1ks/w233aQfmtwjDd/f0Of8nZuLXXAF+RrDFLWTghW9hL6fr6sdxMq2SuzJeJQr4A==
X-Received: by 2002:a05:6402:42d4:b0:5e5:437c:1daf with SMTP id 4fb4d7f45d1cf-5e5e22e66e3mr857005a12.16.1741296282233;
        Thu, 06 Mar 2025 13:24:42 -0800 (PST)
Received: from salami.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c74a9315sm1493110a12.46.2025.03.06.13.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 13:24:41 -0800 (PST)
Message-ID: <67ad046453d722ffd80370d45f4f515a432ec327.camel@linaro.org>
Subject: Re: [PATCH v3 4/4] pinctrl: samsung: Add filter selection support
 for alive bank on gs101
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski	
 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar
	 <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tudor.ambarus@linaro.org, willmcvicker@google.com,
 semen.protsenko@linaro.org, 	kernel-team@android.com,
 jaewon02.kim@samsung.com
Date: Thu, 06 Mar 2025 21:24:40 +0000
In-Reply-To: <20250306-pinctrl-fltcon-suspend-v3-4-f9ab4ff6a24e@linaro.org>
References: <20250306-pinctrl-fltcon-suspend-v3-0-f9ab4ff6a24e@linaro.org>
	 <20250306-pinctrl-fltcon-suspend-v3-4-f9ab4ff6a24e@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-03-06 at 20:42 +0000, Peter Griffin wrote:
> Newer Exynos based SoCs have a filter selection bitfield in the filter
> configuration registers on alive bank pins. This allows the selection of
> a digital or analog delay filter for each pin. Add support for selecting
> and enabling the filter.
>=20
> On suspend we set the analog filter to all pins in the bank (as the
> digital filter relies on a clock). On resume the digital filter is
> reapplied to all pins in the bank. The digital filter is working via
> a clock and has an adjustable filter delay flt_width bitfield, whereas
> the analog filter uses a fixed delay.
>=20
> The filter determines to what extent signal fluctuations received through
> the pad are considered glitches.
>=20
> The code path can be exercised using
> echo mem > /sys/power/state
> And then wake the device using a eint gpio
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>


