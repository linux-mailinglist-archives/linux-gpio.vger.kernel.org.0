Return-Path: <linux-gpio+bounces-27043-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB83BD506B
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 18:28:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C4B1486043
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 15:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00D8330AD09;
	Mon, 13 Oct 2025 15:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VhM1yR7x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1CC23C4F3
	for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 15:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760369522; cv=none; b=d34u3b4s3/y71eKyCCkOGfCt/3EIzcIGb3MLzqg0FVb0Xp96AMYds+OuqKIYHkQizQZB6Gu6O1twuemLpuh8jeeHeZy4yp+3jfBiGA7i/hjctoCpW8Vvrw7zErMqkrfw7JF6jw503Ntwld78u6AdGdK+TesVeO07/TGlbCxOD/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760369522; c=relaxed/simple;
	bh=pmqb/ydiPatcn6XvEcnjNxKYw8PTDZziWWsk1TeUyIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X+fB4jd9XKObXcekAMzAd3RjAw7TlTUarA4ree5QMBY2UFNDvO9hbMTd7T9OJ6VaRqxvWjur0C6QV3EKZdBX6Tw0QutzJ0vBcDSoVGGwo8OugzbWUM7sOFfrLAR1VX0pUC+3KTl2P3//bbJuu6nYljUeNcNfUL0eeOdTofsB6GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=VhM1yR7x; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3f42b54d1b9so3920744f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 08:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1760369518; x=1760974318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ojjQtC23W7ONkh7OE2425RIzH/RkKdd7BAoR+9b7RV4=;
        b=VhM1yR7xW/c3/fN48rTud47n0nrtqfn3uF9r/+aeF+QK6KbJbu5RKcWvNkCQiXdD3x
         X3nGGM48H5HHwLoONcB9238lsjjopfXjeutUfw4UtmtLefm9icgw2NtekVeswwOQLDwo
         yt6iU+G0cKef4fQhSkQA/0XULIhWiwV2RndF+c80Z+jUviwgG6vse1GIolaTF4AWz5AT
         AIWvVNMSwyWJXPg5wkdH8+260VrGDbyHTX/+rYanUiex6x9a7xh6Cs3phyhg35516Oym
         9L+cvuADaK7WmnmCPF9Jd7KtCBkCMWuQR2pYzWwfkPaPq9P+hG84Kf3BrJpK7s8ZKP6/
         jtkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760369518; x=1760974318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ojjQtC23W7ONkh7OE2425RIzH/RkKdd7BAoR+9b7RV4=;
        b=KBRe+8u1+3kknoW4nraGXB3wnkKfNvL9UyU5T6Q2OvH8AEDfU0Ox9ItC5xgZP4Uk7W
         XDLssx9SL5Jf5cBZZ88Y3VpCIr1+JhQl0toFkZQ/v2lOurAf4GkprJ9Pc2BVTR1gw0Lz
         1/QqCIuEEhvZ292NK26L5xaOYZmHSCTIzEUFRiPU58IPkklK+2n92zwRlu93tZ3GdxGe
         NNjnSB1Auxc/LhW5RWdpR4oYBzmDP1zWjGsSBrih/GVvJsQBep+xJjZrTrZgYWjGC3W+
         Sa5gLNhyZBxdNSP1EoYrNKUx1/pm6pu4ngKPi8Ih6jdQkJsc/u1Lj/q/GYyKvBWZuJBR
         Fh5w==
X-Gm-Message-State: AOJu0YyL2FlhrLicjlP1K9paOeoFD0iB+SO9ohCV+yGbpNNpehDtUjaO
	E+W8/qmGbCVTfrtPxI77pXEBPyXjZW+u0G5QvJIyQlUxV4byKZgkiT6CXBlT9GpsAoLUchkbuVs
	y3l4D8BU=
X-Gm-Gg: ASbGncuhJCvMuvTgK0orFlbwG/TQFYF4Z/Jg0s4yr0nQBd7ooZR7pUN9WMlEnH1PivJ
	ek1xI+UPGv4gtwmxrs3aWJEzYVCMUpDfP8B4rfA80TZ2KIiNv/yO5ZCvhKsHeuKvMmvIFW/V1n5
	jeSkLFEXCVzS01sClzanD0giiMU2g7MkyZ2Z/EchfnZpsk+ErxSj/p+B4wMJHIr9XKFl+zazrOH
	lkBDSOwXoBpHbEXdYP+3rMxeqQOqqCuWnPaLqBEo2DBgdgy6BsO262/nWMuvkLf3EwOSHxFYgBM
	dbo7D36XWO4gJY5m1QpqR6b/ZdeIKWBfGn+5LGCCbHO3klqRcrYHoZHTrrGUw8pnPYZY+wqTSSc
	2DmZ9ZQCuoQ2m7G+d1CABeirJx3uE0Gf8xr4KnxS2bUa+RQJcJKJ2Yw==
X-Google-Smtp-Source: AGHT+IGqH4/O9BL9FRfEy8OKdHmhcGm4s9EAzGrA2XU+aqpOA0SMHhpEa0onPTJNxw3cMw0uDP044A==
X-Received: by 2002:a05:6000:4301:b0:3d8:3eca:a978 with SMTP id ffacd0b85a97d-4266726d56emr11902028f8f.21.1760369517677;
        Mon, 13 Oct 2025 08:31:57 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:fc45:d50e:e755:a6e4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5cf6b4sm18986470f8f.25.2025.10.13.08.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 08:31:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	vfazio@xes-inc.com
Subject: Re: [libgpiod][PATCH 0/9] bindings: python: improve line requests and reconfiguration
Date: Mon, 13 Oct 2025 17:31:55 +0200
Message-ID: <176036934323.221490.8883812859660598895.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251009130516.3729433-1-vfazio@gmail.com>
References: <20251009130516.3729433-1-vfazio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 09 Oct 2025 08:05:06 -0500, Vincent Fazio wrote:
> This series makes a number of minor improvements to consistency, speed,
> and code clarity for line requests and reconfiguration.
> 
> Patch 1 makes iterating through a configuration object consistent across
> line requests and reconfiguration and helps condense code, making it a
> bit more readable.
> 
> [...]

Thanks! Great series, neatly split into well described commits. All applied.
I wasn't aware of the warnings module, thanks for bringing it to my attention.

[1/9] bindings: python: make config iteration consistent
      https://git.kernel.org/brgl/libgpiod/c/8c9d5b4fdfd846a48043f7f01fbd70c727c0bcca
[2/9] bindings: python: remove unused attribute from LineRequest
      https://git.kernel.org/brgl/libgpiod/c/11aa4254b2e5b67ba6c0b64c82d2647d2d8b3f3a
[3/9] bindings: python: chip: track requested lines when enumerating
      https://git.kernel.org/brgl/libgpiod/c/728a2f9b22f6f1b944780632972b36d73e1c8db6
[4/9] bindings: python: chip: simplify duplicate checking
      https://git.kernel.org/brgl/libgpiod/c/ea21b447d7f5631349bc53cf408ba88cc3ff68c8
[5/9] bindings: python: chip: check mapped_output_values membership once
      https://git.kernel.org/brgl/libgpiod/c/0110c11626572a5aedd8b3487ccbb39980e85dc3
[6/9] bindings: python: line_request: ignore invalid line names in reconfigure_lines
      https://git.kernel.org/brgl/libgpiod/c/e2d7b6abaf013f495b9875b28f556ccc25461085
[7/9] bindings: python: ext: add ability to query line name
      https://git.kernel.org/brgl/libgpiod/c/0c0993569c54f573914656d30e2126957d933600
[8/9] bindings: python: chip: map names for lines requested by offset
      https://git.kernel.org/brgl/libgpiod/c/6a7d3306e4afa86103c6af5d37a5fd3c04504d3b
[9/9] bindings: python: line_request: warn on unknown lines when reconfiguring
      https://git.kernel.org/brgl/libgpiod/c/962a1924e106ffd3d9f2b7f03dbdfd71ebf701cf

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

