Return-Path: <linux-gpio+bounces-11307-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 018F499CE7C
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 16:44:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A149F1F23DDC
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 14:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C3F11AB52F;
	Mon, 14 Oct 2024 14:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="MY9/7u4N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEFF1ABEB8
	for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2024 14:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728917054; cv=none; b=TkpCLW/NJ+o/FwuBF4okmR+Vr3Xc5H8Xu5dtgMcSDsM8qFH3WSOoHlAhJ3Mn9jSP3zJhP8djr2OIEyWO8LWUAdW47h9r4FfC5OkS4cWWTAZ4lq5Jb3CzPEfPGATwK9OQozwwoeAhEE70glsa4LO/LSBF3Ugo6y6oiv1VsIPVvxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728917054; c=relaxed/simple;
	bh=Z1UkT5rQZ61nqgLhZYvisQf6CH7JWbYFDgpAap2KA3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dI4oKHe6AF4kDkLrKrdmPyVcS4SWrj+UglO5P0D2fvQxW/paratVesedHp/YlfJ1GF/scn8UNMjAg7ogNFNutS8IfOeoRkWsoKTEhiBHiIJ/ni1oaDdN0Hvf3RwIzzJ92BBOWW1NUM7FuV971RUgWthJUQR8YRgM49+pyVHzB6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=MY9/7u4N; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43055b43604so42372675e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2024 07:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728917049; x=1729521849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wV+gEMonGyvknPgJBbcDSXVuq2Rpvb7UAdZkSivPrnc=;
        b=MY9/7u4N6LTvkFNcosHw9H2f+7aNxVtblZgKH78VBjWAtJqZ5MDUin361IRLzw9Khz
         Z4Bgkf4n/hrJumm9uqKEPWmqfUcn0NldInPmPnamwfQZf+YDsrETGZuTAnp/A1HLoVZi
         UhY1uHlQ9hnj2MTq7FP4AYyqL8309Svw75MQNrXi/l6STg0F+nd9JkQq4zq2L11pwB8i
         5y5PGyR8P34UhcQ7bxKAeOZ2h3DitNPnM5Zmeuw+5GTDtSx1GBgjLqbUF+hatiJskJ2t
         fOJqOFJArnYaRW4BLYwa1XYoeVmBzI+uxK7E3I/9FTtORBvb7RtrjLc1/fLxtX3ASFNN
         kPvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728917049; x=1729521849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wV+gEMonGyvknPgJBbcDSXVuq2Rpvb7UAdZkSivPrnc=;
        b=ZgOjADn7/FgfMcnFZZkbq/0t5dQFq0t0var3EwxyJXn9wnfoUd1Lfx4lD1SfGJ6zTq
         YkgFRVw2EbvLh0mnxBR6+YroeBrYx4jMa2nA2mTYTLJWJXpP+L6oCDybYiB9uwh05tUy
         tikKWhCTRl8Pvz+DKSiBADDtaFnBDMngY6OXc+e8CTDfUQIT549GgQWPx9gICjfDCLGN
         PNNe07yVRIy+XZ78kMWxpEi8XPTOdE6Ukqu3hjoE2jhoXvRRhORK9KMAbwJXgVUbDlaD
         ao5J15FdfEVfhj4OUC1USqzPy9g5P5Gpy3cCTjEokzYEDdeRWoG6dkcSebqptNc8tTr4
         0J8w==
X-Gm-Message-State: AOJu0Ywk4//8H4dpuPRoIsGVCI3zoNiGPZ3Mbke3IGpLNz4SM9uC6E1X
	RE0zzcV/zdwKWrkEanjB1HPNaLbRPOedDOhljWU9DP8JcUBhsvcINgjLojXLmLHNL+gFKuaa2Pe
	L
X-Google-Smtp-Source: AGHT+IFn/iUpI2+CVb13bl0Eri+5McgDBoa4KOAC3KEK/zYeBVTH46Zfe8IgVgSOVx5FkQGN+egvsg==
X-Received: by 2002:a05:600c:4e8e:b0:42c:b4f2:7c30 with SMTP id 5b1f17b1804b1-4311df420c8mr103517815e9.23.1728917049361;
        Mon, 14 Oct 2024 07:44:09 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:de54:ebb2:31be:53a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430d70b4331sm156425465e9.36.2024.10.14.07.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 07:44:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	Vincent Fazio <vfazio@xes-inc.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	vfazio@gmail.com
Subject: Re: [libgpiod][PATCH v2] bindings: python: import gpiod attributes in external module
Date: Mon, 14 Oct 2024 16:44:05 +0200
Message-ID: <172891704160.127525.4600553915822259466.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241008175139.1198980-1-vfazio@xes-inc.com>
References: <20241008175139.1198980-1-vfazio@xes-inc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 08 Oct 2024 12:51:39 -0500, Vincent Fazio wrote:
> Previously, the external module relied on gpiod attributes being present
> within `globals()` to construct return values back to the caller.
> 
> This assumption required callers of the external module to have imported
> the attributes to populate `globals()` for the interface to work.
> 
> Having this implicit contract is opaque and prone to causing issues if
> imports within gpiod modules ever get reworked.
> 
> [...]

Applied, thanks!

[1/1] bindings: python: import gpiod attributes in external module
      commit: 035ad74fdd69bc3cc3650d3db113ec2563805104

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

