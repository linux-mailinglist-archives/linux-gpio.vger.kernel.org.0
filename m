Return-Path: <linux-gpio+bounces-24469-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 126F2B29510
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Aug 2025 22:28:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6FDD188BBC5
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Aug 2025 20:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76A9724166F;
	Sun, 17 Aug 2025 20:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MftTbmY6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCF715A85A;
	Sun, 17 Aug 2025 20:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755462512; cv=none; b=L2xheDr9S4Ykv5mn9UYJTbUIo1gxT2X9KJtdoQGZbpuD4kpJuQ4zs4QeCOpHPDx0wFao3y788ABwOcWm0Mz7qOzGV6DQ+OXqoe+FZ2sUFw9JSN5P0G0tCdqBwad/16gemAEfE+r6ZlCgrk6X2h6LvTDKMS6cddH1x8bvamyjLmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755462512; c=relaxed/simple;
	bh=ewyhE5rOOHRrhA2irhmRVxhNqn931+IK/ET4AwII7U0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cQnVHrBW5ojEg1QAt2jMFEHce9NDKEd5CC7/2i1aq/dXlYfBZU72oJ0sEDRmxlpqCSzbENLV+f6KSvLGbXE+1MU+Hxb/DMiES65OSSpG4gn+O0zW7nlfAz8sc5+qzffNGz/FzAiW1Xh2/1Kp3zJF26DfgXSVesZ1eIjcN+KhNDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MftTbmY6; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-244581d9866so28367015ad.2;
        Sun, 17 Aug 2025 13:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755462510; x=1756067310; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B5FzmTLswZzbOXBPvvbc2aB07rjQ92za6IFLWDHDVQo=;
        b=MftTbmY68nyJB1j/EV5fbBx5uU5kw8hG+wXHRXP8ipxg5u2oqcdnRX9Ob5Kr+202Wy
         iMrkE++NbFxiotdn6vWp+M6tIO8VzOt8bKS8/R+T+PWuGf/ObKF4VOasoNyR+ShThZd+
         SFsmOxp0D5hsYTgEq3xOf7uHqNGTdJVhZ6fkwODDeQN3WGAWUPJlRqP6dXjGVYczFGwx
         e0u+zNkb6Xcovgn6mk924x8SBAcL4wc2qBWixZXZUUrojGGMKmJlu6Rz6iYpGBzbjEx7
         ZLGWzK4vtaVPf/BRtwolzK897FwzqiwgqgjoL5leOTK79wxcnlLIMtRX5D64KIt1vmuN
         UqDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755462510; x=1756067310;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B5FzmTLswZzbOXBPvvbc2aB07rjQ92za6IFLWDHDVQo=;
        b=csPEB7ZEOmKXtw5ytY4gymdzrEZPTX2xBfxSNRgv3DxwCCvjIbncBYgL1J3ntHpaCf
         evUf8i1Yon8vLPqvz29U5y/5BtN9RILtLhjzxYPrkJ+3XrHB8oLfyp+Gd+lMEJ9m9usd
         FoM3vynDSLhvi4e/gMox4YHAShf9RQ+FbeXFsqHr7LBMhn/wJPL2Dt42EgeVSWT1dynL
         CQsNBRryagPSQ8oopxqH59mExNo2Z2DrltxKfHXK6BQ4lwS3gb6lXVPEzPl7P/e2YcoX
         7MyNPrs72J2QxG/Ox9pqn3AXQzpyAD8muo0GpM29EtXeff2RcFJpx/Ta5zp3QwrcbbB2
         opOw==
X-Forwarded-Encrypted: i=1; AJvYcCUwy9Gb80i073SpZ9durrvq4NV4otCVVrubQ6gEQUMiJXnkDp2Ydl1XGbGlkn9fciES7Y3fF0x0iQGHWTmx@vger.kernel.org, AJvYcCVT/xbY/6R5ASqZEFncV/VPEB6dFmAAziQzqsbPILRsJsKbMiqwEnROHth/WtbuFykQzeAiMYN4XqQ=@vger.kernel.org, AJvYcCX4KV9m52WoN8aiPiCtjzosNJU+6W4/TXbhfUbFu95/ao9keRi/Ghs0tXWov23n2zwVyNN0oWUnIdrd6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmysJ7gFlkRSW6mYac9aDusnvEfivJTSItUipqzjPbgfvDPDl/
	LswrTykR6cGyUTwTwv/wB60Z2qBGT0Qad+SkCpqaVbEuKxgODJAtoxhT
X-Gm-Gg: ASbGncs4Oedmm73YNw6MB9DWbMRTcAES6IHF3K2OZ+nBKfjzbpZMBDpahPr5p4yd4Ma
	qpgu33DLSpKYGXz20H+6hnECKPdI7tRr4soQmgEVsC8jJGhj6En2uJqahUU6OsEC9ino/91uOLm
	jnlsNJmw1GZ13axeS00ROIObZX30tqAXeiTfm0EAaxkO8p4KCSE10wOi2lkVtYUHKM3ipzjNw6j
	eYBpd3Mbjqhm1RnLiGvwmMjKvPyoIrLu4E/3acz7A5ckyrDeNeYv7XGsYa597PL3jl+43DnwXZw
	Ov8efITIivPng2wnAdraomboFEdBC/a4DEZsiwbxgrAcj6QjWEkw33LUdu3yOvbsAx/n4ABwae5
	BHkrw4ssTl4jCys3r00DFyhw=
X-Google-Smtp-Source: AGHT+IFReg9uLxf3fTCI2GcK1mj7BVPUAk7GVWqcLnzh++rW7XXkMMYL9GZ7dldGWH7fZgnKjt836Q==
X-Received: by 2002:a17:903:37c7:b0:23f:f96f:9de7 with SMTP id d9443c01a7336-2446d94ecbfmr147284775ad.51.1755462509962;
        Sun, 17 Aug 2025 13:28:29 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1c99:c9f5:d858:a21b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446cb0f007sm61001275ad.69.2025.08.17.13.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 13:28:29 -0700 (PDT)
Date: Sun, 17 Aug 2025 13:28:26 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Corbet <corbet@lwn.net>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: gpio: add documentation about using
 software nodes
Message-ID: <2eq7nuv2zddslzpfui5plh6b7lhvqwrv3ik5wprsatu4ubd7hj@llyibugzcrwm>
References: <ce4pjordujfvaujjgxruszba7ivoywex32rfwzeiil2zcdlgl5@lt4vvv4yalzm>
 <8bdf668d-c120-4ed5-a0f4-fe8c0876c8d2@infradead.org>
 <f93c26c6-c390-46d4-bdd1-4d2f0e03e63d@infradead.org>
 <b69d92aa-2d41-4b79-ad15-75b73897e263@infradead.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b69d92aa-2d41-4b79-ad15-75b73897e263@infradead.org>

Hi Randy,

On Sat, Aug 16, 2025 at 04:17:32PM -0700, Randy Dunlap wrote:
> 
> 
> On 8/16/25 3:21 PM, Randy Dunlap wrote:
> > 
> > 
> > On 8/16/25 3:08 PM, Randy Dunlap wrote:
> >> Hi,
> >>
> >> On 8/15/25 10:30 AM, Dmitry Torokhov wrote:
> >>> Introduce documentation regarding use of software nodes to describe
> >>> GPIOs on legacy boards that have not been converted to device tree.
> >>>
> >>> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> >>> ---
> >>>
> >>> v2: Addressed Randy's comments.
> >>>
> >>>  Documentation/driver-api/gpio/board.rst       |  65 ++++
> >>>  Documentation/driver-api/gpio/index.rst       |   1 +
> >>>  .../driver-api/gpio/legacy-boards.rst         | 298 ++++++++++++++++++
> >>>  3 files changed, 364 insertions(+)
> 
> Hi Dmitry,
> 
> There are a few build errors with the example code. It's OK to leave that
> as an exercise for the reader. :)
> 
> There are a few missing header files, but the biggest build warning/error
> is a Section mismatch:
> WARNING: modpost: gpio-swnodes: section mismatch in reference: myboard_exit+0x1f (section: .exit.text) -> myboard_swnodes (section: .init.rodata)
> 
> so myboard_swnodes should not be marked as __initconst.

Ah, yes, indeed, I'll drop the annotation. Thank you for all the
reviews.

-- 
Dmitry

