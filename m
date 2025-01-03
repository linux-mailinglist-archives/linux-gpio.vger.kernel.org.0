Return-Path: <linux-gpio+bounces-14444-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F34A00225
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 01:49:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7B071883DE4
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 00:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EDC814D2A0;
	Fri,  3 Jan 2025 00:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zfx90xal"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88208BE5
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jan 2025 00:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735865343; cv=none; b=OqBBql3GU6oWYFnfpn4E0EqZ4QgBDzVzZVIiqf5stg/JDkfH8jsf55dLo4+2zVVm4q/Kfv7P5J8NDTvIMyi/P+eR1CQ62C7umyY4L7B3yuMeAw4V9wzTG0aPJwsko4ygJ4bRjAsAFyrk1Xc8z6sI+znbmjrO6zAFIV8qFETlQCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735865343; c=relaxed/simple;
	bh=2oAv3GTMkxd/jMIXCz20Wp217o/Cl+peGPs01Gj4JL4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IvUaCiP2197dpbbq4pcUD1M88TsHnW6qGovIihATD+QjV0WS+Csnnl0h48IRMCQlUdhPHEuAjgx+9Q+ZvRnWK7Zt8DU/tPHucZYeJmr7/+65Wsue6eHe5ep/jUSuNQ1F1ARJ4mMj/gOPNFjNcybl6Nkdruhoswa7O8aFoP84GGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zfx90xal; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ffa49f623cso152639101fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jan 2025 16:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735865340; x=1736470140; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2oAv3GTMkxd/jMIXCz20Wp217o/Cl+peGPs01Gj4JL4=;
        b=Zfx90xalBT58FQ3aCJfYAOmVTNaB5EHAYTFzv7gGxEhmHIZq6gscOTxSRuTV/HURHD
         RLsY5FmHnRuCwRYUyTVwvWdjQASobk9MCgRe7Zm8Vh9uC2Z7q18c48oS/tNEcEWe4LyW
         qZtY6v1uVxeAwAWHC/2VqUXuNRSYdu0Xk+c3NiI5ZkC4etO1gl5uZIDHRGakb7nx2UXA
         UK8W+WlCHOcmgUVcnk76Ln7NO4QUHGYeuLLboohKjQ/nslXt0XYH66d0Ye+DdL0DB16k
         qcnLzuFUwVJoPA97U6GGxPvAevfMbIO+XMvwqY9shW8rRJ+z39weO8AVKyBE+YiKOtu1
         vyHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735865340; x=1736470140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2oAv3GTMkxd/jMIXCz20Wp217o/Cl+peGPs01Gj4JL4=;
        b=Ehvi0jD3cvXHJK9kmn7Z6Aul/jDkhfEdyB5W8nLf9WMqu3xS26bV+N6C714vHBPe+c
         WnMvZP+5dbF6tsIxYjJvCpYiCMtYXyapFU9atFpTquQreWN/427wJK1vGgjeqF9pdUtU
         Djd3pVKl4UiO71uXFmq1BvklKUtelteFaauxh3XikWdlDHsloBO/Q0OQGetGZVG+oZSv
         i7h6DTI4J/PRXcmPoINeFuPsjyDEwTE0daO5fFKah4kSeWzuwN2x5uAkzmk+USyT70Qg
         vVXIcz8zfod60AxFzbSu+T3GEBzardZzAxOfwB+jeGtffpjkasAZEMwvbCG4ZfPjzNSH
         RCiA==
X-Forwarded-Encrypted: i=1; AJvYcCVzS5wJItCn5L0pw3Nap8Gp4uzbit/y2BNpC5hyXM8y2xfxiKhovjIfpumoNcAFkWnzLhByn7BLBipF@vger.kernel.org
X-Gm-Message-State: AOJu0YxeXKEnTtAf95eGcIKxyk+I5at+NnRlbJLhu6BWt6LzjguqLw7L
	EEj/7/+35U2ZM7w5AIOYM2XcIN3+u3EeWSukCDMEwQpGeXw5dZ92vQC9Po/9LdivQ8kZZ/1H0o1
	LUQFXlQrd8FzdVq94OnMh2y4YsFJ9sZMTNrnEPA==
X-Gm-Gg: ASbGncvNz+jzoYtcXLMSCSPEXFEYS1tAj+HpAF4xdS8X8nQrlULn8gIJwq5b2I7ljaI
	LujRJrqMx5P/My3r+XIX8NgmIIJF3PkcTk+HV
X-Google-Smtp-Source: AGHT+IFXWQX/f1UhbssTBaD9+6l52DI5X3zlRf2eEh5tClnlyupd1zkpxFpa6GGZ03maQWFsWSTLszFhw8NtRp5I7TQ=
X-Received: by 2002:a05:6512:3b1e:b0:542:2a20:e695 with SMTP id
 2adb3069b0e04-5422a20e76emr11167945e87.9.1735865339817; Thu, 02 Jan 2025
 16:48:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241231133106.136237-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20241231133106.136237-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 3 Jan 2025 01:48:47 +0100
Message-ID: <CACRpkdaW9gCY760dbMohLesLgNTKTjD7m5jGLqi9nvUwu7hmhQ@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: samsung: drivers for v6.14
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 31, 2024 at 2:31=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Fixes for old issues, not critical, so not worth current RC.

Pulled in for v6.14! Thanks Krzysztof!

Yours,
Linus Walleij

