Return-Path: <linux-gpio+bounces-16681-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B24CA47983
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 10:50:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6A2547A3916
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 09:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55983227EA0;
	Thu, 27 Feb 2025 09:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vQfM+RrJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4852A22617F
	for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 09:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740649849; cv=none; b=Yd/V3ly7JKYjCc1pkyXk2hjHa5Cv69TSsXvCAZgP0VRmn3DvTsOkah9ZOJeXXSCrVr5M5HgawoTT1QXJmoKqHxK2BvkeAYg8ClKt3VsltocmumczL+OBeybklKMbg+IjnwhnVYfWQXeMZ+gCeedQGwYSFnKh4zxxNaGFTkLxt1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740649849; c=relaxed/simple;
	bh=JhprjhNGU63msoAiOGmeriNLaEZHK7YZiOP8jQzP/dw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=idtH0Y12YeezBgFxxgSpohusTqIQHc1vmUhXieCxfdPlcyrUfr8FYYhxm8GTkbPKTp5M2paLgP8DXjiWIaBavz1S4pU+IVTKfKzvY9iMpCj3LCCTWb5Dy8okIJPU9ABXGRX9WcEFZSkHG6JbXrdBNANaf8kXQdBT6Z5U8kM5iPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vQfM+RrJ; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54843052bcdso633787e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 01:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740649845; x=1741254645; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JhprjhNGU63msoAiOGmeriNLaEZHK7YZiOP8jQzP/dw=;
        b=vQfM+RrJHr0dn/DTCcnS66eHSde0IIF/AgYsLtgK6zufLndANnU9tYgZpX1OH9mcTA
         kvKjDIDTVbA0UFMeyth6MZ4Wd86e0naavGpM/VHs+duydVdF1RjQnkjC1vM9fP+D0qnG
         h3NadhMGDzuLjLKXSWkfEu/rnktvkPHMV7oLnTkK8fxYZLawdwPvtDBIwvVfiqs68qRJ
         UMvsGLPDOZ4PTQFnLxBfjHKnzWK3NGQxnIlKSV/r9hk2IMrlvEqA/rNxk1R45CQP0Rgw
         Bejrn4huqi68orDqUAW1UxE0xnfMnnUm4XoUxN+gNtau1h81dsr7f4rHzM3nQ5U+4CkZ
         EcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740649845; x=1741254645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JhprjhNGU63msoAiOGmeriNLaEZHK7YZiOP8jQzP/dw=;
        b=I0tu7OCqNOnMZzh0HYeQtOJvJaI1EKdXhCYr+CqhTVGSwQV2+OtYmGBdMPpoLFPMYs
         GfKTatPEolGZMKqnsL9YrmN/7K6jwqC0wFemoxAonHiNO1wFFMUeH3JgPmyvJunBkeXp
         Vf/LRaeopFAsFApyjrqB+CHa97c5PcMOc6xPnBJh1EsgVwV21QnkhMX3LJLg585ftTed
         eZMHrlbQiwcRXSydD0lQi0X36yyHsUNXFsYPO/S7qkL/zfQIiLietjw0kGRa5vrAWP/Y
         uSp3YcVM+P99p4WGBOnyoTSJLB7WcD7e5vqPozN5IWnaJzEaAgFGcN+Pxzw7wPRiyzNB
         tVsg==
X-Gm-Message-State: AOJu0YwAS6vsuOkoiOBc+UmxIgRrQTIvni04RjV8DMiQwHwqpf9WJco4
	lNMIK/VDFHnnvpWecY7iL6k/gUaE29Mq4o5w+h8qiQk0IwOQFZ0OpQVf8pW252zgxdsv6Nne4Ki
	wy6SA5tpIUN8gjIK13t5HMkru1jZJFkYLY5sRWA==
X-Gm-Gg: ASbGnctVoqtmovqyHEXHf7nKAqLE8mab1rdqxs+k59H+8RJ6QID+bS/OA8OCN+pUZGP
	ug3KQ9API7croFfuAFInWMA1TpgwTSNcB0wRqE79et7whTNxUiTLUCYfJW786Nth71jBodZuUEm
	LpLg24RfsTMEg0un67LzWBfkBgk+zyaPNQPbGD1Hk=
X-Google-Smtp-Source: AGHT+IFbiJvRVzoFwDbFSVd5B6zTEFgxYcsfW1YUePY1yNBsqtfbnEYxBx+5bOe20D59I3fbVQMpb6DVvjkY8l21f1E=
X-Received: by 2002:a05:6512:1245:b0:545:fba:8a57 with SMTP id
 2adb3069b0e04-548510ce6d7mr6071935e87.8.1740649845214; Thu, 27 Feb 2025
 01:50:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250224143134.3024598-1-koichiro.den@canonical.com> <20250224143134.3024598-6-koichiro.den@canonical.com>
In-Reply-To: <20250224143134.3024598-6-koichiro.den@canonical.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 27 Feb 2025 10:50:34 +0100
X-Gm-Features: AQ5f1Jo6s8T3_PtewdIHwaG73e4cupz4e0rAlKoBC6UPcHdC26Lg0W52n3dCQRc
Message-ID: <CAMRc=MdoMKdqyzGMFDa3aMz3h=vfZ0OtwARxY7FdsPKcBu9HQA@mail.gmail.com>
Subject: Re: [PATCH v5 5/9] gpio: aggregator: add 'name' attribute for custom
 GPIO line names
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2025 at 3:32=E2=80=AFPM Koichiro Den <koichiro.den@canonica=
l.com> wrote:
>
> Previously, there was no way to assign names to GPIO lines exported
> through the aggregator when the device was created via sysfs.
>
> Allow users to set custom line names via a 'name' attribute and
> expose them using swnode.
>
> Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> ---

IMO this should be part of the previous commit, there's no reason to
split the configfs implementation. But only change that if there'll be
a v6, otherwise I'll take it as is.

Bart

