Return-Path: <linux-gpio+bounces-25827-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFD6B4FC05
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 15:05:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B75D189F2B3
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 13:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A625533CEBD;
	Tue,  9 Sep 2025 13:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NQT574HF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A272A2DCF55
	for <linux-gpio@vger.kernel.org>; Tue,  9 Sep 2025 13:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757423124; cv=none; b=X8TIkMBsC0IKlwyr8JXQuBE4aPvYHqqj9qWAfdn0Rynww0tSNnzfpAK9+K3kj/JI6lowYa31iFOA1T9Y8UtuZ/TTH/WEF7XfpfZTprTsyC0dBtWmHOngGBwgKcwiuFRkMsAGPXqt3JZjILSLnN+qRu1xz+IqCMxlTLwHB7CRRnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757423124; c=relaxed/simple;
	bh=TcyWMLPoYto+mdKEfw6Yjt3rqFZrAfiaW3v+xtmjurc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XveFnO/iSXVceEpBwdBbewLebbjxPrlv4fCF2LjcxyuD/6z/sSvXu0czinFcgomgvySr6vr6+pOzgiMtbcmlpdl+uIlES9zYD7Z9UNr5slKzKKiIynu3wvmekL+o9D0JFY+LL4grbLM7QWZdvhIjgD73mB7lL8q63tmZgzC7hIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NQT574HF; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45de1084868so14018615e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 09 Sep 2025 06:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757423120; x=1758027920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z0js4rcoTcuS2twmO6+PPmfw2c1jaQKS42WM1sYEjyU=;
        b=NQT574HFWgqt+xN/JrgBoAcLApuzuSWr+tUf8YBym9wsUWKGT4sA548ndinL5ZuAMS
         lv5gNsvy5/uHe36RBFqhALUxWrs7LlhW/C+x4lZvv6F5j/tH7nf82jjX1QzCmTtB/TEK
         kAhzFxQhe7t/CLHeFq37aZ5NE0KOl9Yzp1Z8v+R7xpeHuf1SvSW7opOPnh6v2DD5h43f
         GHcSQKq4d6sQPoRx1IGvT8vtHT49KFsiZDwT4hKlv+pOAWDbL+qVKvLUlT55jCMVCOrw
         rNtUzc6wloktPKmsec32WxLt4lumambBo/7WvygnFWPI/z2mob7ESe5P1xI2oWKpzqs0
         OHHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757423120; x=1758027920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z0js4rcoTcuS2twmO6+PPmfw2c1jaQKS42WM1sYEjyU=;
        b=f77xbLG13cQL/6k5EGcMXHPcERmdYBg0w39RghxnPF+9GBaoC8vKCN8hHkg8Xp5Lh5
         q3Ub9FtCqYKLXYoi0VsJjldm0fRaD4pKBYg9X163UuO6CTvbcBeFd/HdbZRIZ8jwKC3h
         N6EOBuzIi6+4TBTSe5eyVD8S5+CNOmAXPpeaF3sXuie6XwP36EL/wI09cZMA6cLQKK7q
         z4eirtjYGqBXYeCZw/QR4V1NoNhnBj4fKlbs3YBpGdax/iqWGKvJnU2yg/M0NVWngKTS
         qPiPjRORW+AtctwlawVgAKrSuC7y2NFIeIqvLTPRBeQJC963wWwiNo5P8jfmBGzpWdrt
         TBMA==
X-Gm-Message-State: AOJu0YwasXo6KgYFl1nWurDGGwWdgYIvzFA+XjfYh0YwVAjpER/LaxHF
	QPdnZ0dQk/IizfHiwxqOrDZJ6ug2zVbvB3Y1GuFMkxjyWu7+lkodzVyuAYpne2VeNWIftEIkW/B
	hRQuC
X-Gm-Gg: ASbGncvSxj/Vn8Bm4fzhyy2pUrMhM+oz1LayqJqkxleEX6WxKxjs/zAsGznAZCt8j47
	4r0ebB9c7M20lRBG0C7LuRvURhdaBhbREUs3i7Y+p131nHtaejfbHlygq3DBhYE7dKzCRAnK80r
	spNlw6Rex3p9lHbilULCN+hwejGNE1IGWAX7m0G1amE+e9zQWcnCh2sLHvjxLszEIvYP3YtyyPD
	kgV5A7iRAFB7cT22usOK2f8B5aRste1AYFFzsUeAptykex6MgebO4PjZ3q6kVG1ErtX/sygVXD5
	v2UMxj1h0Bj3KXDLxzKG8frqr57d1SNx3ihLrnznxx8dL2H8buupGoeLJ0BZdl8OhzkhJNHz6bh
	s0KShTMY1C7wtQAcpLj4uIKDcsgq6dXPI8OA=
X-Google-Smtp-Source: AGHT+IHDDw2g+Qv/lv9hb0YY74ex2sujIC6LI1wloqwwWE66P7vYs8qwKqXVdBmH13z0Fy2J5JLaTg==
X-Received: by 2002:a05:600c:4fcd:b0:45d:dae8:b137 with SMTP id 5b1f17b1804b1-45dddec8468mr98922505e9.22.1757423119951;
        Tue, 09 Sep 2025 06:05:19 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:c1ee:7be9:3ebb:6cc0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df16a749fsm18905585e9.19.2025.09.09.06.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 06:05:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	vfazio@xes-inc.com
Subject: Re: [libgpiod][PATCH v2] bindings: python: use quoted types when casting
Date: Tue,  9 Sep 2025 15:05:16 +0200
Message-ID: <175742311384.111789.10099018002421662632.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250909125300.3507377-1-vfazio@gmail.com>
References: <20250909125300.3507377-1-vfazio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 09 Sep 2025 07:53:00 -0500, Vincent Fazio wrote:
> Linter check T006 [0] recommends using quotes around types (making them
> strings) when casting values to a type to avoid the overhead of runtime
> type evaluation.
> 
> This provides a small performance benefit at runtime [1].
> 
>   >>> timeit(lambda: cast(gpiod._ext.Request, "a"), number=100000000)
>   6.4817840601317585
>   >>> timeit(lambda: cast("gpiod._ext.Request", "a"), number=100000000)
>   4.369633618975058
> 
> [...]

Applied, thanks!

[1/1] bindings: python: use quoted types when casting
      https://git.kernel.org/brgl/libgpiod/c/36f1e51b37e232a26958e50c66238b9c0d5c525e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

