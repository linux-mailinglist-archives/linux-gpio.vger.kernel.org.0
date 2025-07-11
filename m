Return-Path: <linux-gpio+bounces-23155-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5E2B01B44
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 13:56:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D56D2587FC4
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 11:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AEB428C2CD;
	Fri, 11 Jul 2025 11:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VpGS5zlQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72735280CC1
	for <linux-gpio@vger.kernel.org>; Fri, 11 Jul 2025 11:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752235001; cv=none; b=IwbfuQ/VOY8tNnivEQDeXYXpSqSVM1TX7R1ibAIaXHrxnyhQv9n3m2glfxZ00OfGnNgG7ut3OC+0edJJXaLew4eLjGOLKuZr4lKEJLCpynuyoovlAYRT+XtbLbxEJ9NHf/04SDyZefwjMjC0tAeeZSwrcWusyllj2pi5/NauSS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752235001; c=relaxed/simple;
	bh=sUjypECAV9l7HpwETK+19weztSxnrqfSlI7t2+qKBTU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fpVhHdcO+AannM8um4sKSsAeF9jfVp+O3fYe7jrWnWVY29cFfCpxGXVdzmdfYftYQKavOTm+tg/RTGLOoeofmctGkTTjoqyiTACzhrUVBJ0hWWoWvhr0H4yKbMHVT2qZJt/6JwsFtjWlNOrm8m7nCRZbYCAHOkR16uYY7QDB68g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=VpGS5zlQ; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5551a770828so1917610e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 11 Jul 2025 04:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752234997; x=1752839797; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sUjypECAV9l7HpwETK+19weztSxnrqfSlI7t2+qKBTU=;
        b=VpGS5zlQCzQN5ju5TJ38Gnsirj9NMAsPo+LELpIaL6V+TvAIAlOq3dWAQ3k6IAnm4Y
         DotV2sV+28vZE/c9hpJqTwJwy31ipWe0m9e3fZmi8BlOxzKF1J61ipXsIDgRaTzHvlkw
         UlRxy7N3yywTjQqxF0G83aw0bNv+wX8F+xD0YnKJyO+rMry5NbX82WAee245R5Bd34ut
         lWvFe/JGyF9RDkl9vwV6dmAmuQNbkrhg14IpDYFOp+ZfSGZFgQKNnSs5JbfA960FxH5D
         DYQQxtkE6V0C4i7K8M6FxP7GD3PZKXewe7eo9FiZIJ7gVIjWy0EPVyS+AoRY7HEGlJAz
         M4yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752234997; x=1752839797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sUjypECAV9l7HpwETK+19weztSxnrqfSlI7t2+qKBTU=;
        b=Wd/WtfdLc9tb2WgtUDEPSP8dFrTLdJ2hYJWuUcWn7Y198YzrCJ9k7hRuDXQy5HM4wi
         RvuH52ICL2j1kMChLbKBRWH3L4jaSapZSrJTZs1WJqDXQJY+WRZ9ljLyn7uEG2vswLBL
         5JiH+CyoElDuy3ZeIY/md5hFxTJwTDxoUmuk7nFnM3cRzw2NMEWGXmFLe+Cbtlxkxq4Q
         w7jCQRR48dpl+b6ynf+ymK/Iqt/2vL3Ud8bbiaY0XH2ZTTIB7Ahxrz1KCN+I8dfeiwiX
         9qPy9cq83hTpDcGTx1fNdbPtqe10P4Jn1uKsP19HdHqDL8U/kQKcwDPV2dsc+aQlnVKr
         ESmA==
X-Forwarded-Encrypted: i=1; AJvYcCXtEwa/SGeyWZ0ai9JMa/pNYBctko7BnLkHl+NSPnwbd+ijZNmP5MSqKLEroAAYX9ac9zyeHJPLk+Rt@vger.kernel.org
X-Gm-Message-State: AOJu0YxZt11Ch87wGFBPVTyTfvOKXxvKu9bIe7mCvV11qqbbmke6wjgS
	aL8WEvoUi42YHGp1xiTl5B+fEd8V7JGdAEnoGO32P47BUxm6YSpOS13x2n1bHQ6ZzVhnwfUiaNe
	TbI0m/nE39n4/6teGaaeHtLyg+3MI3RdDzI6qDAVMFiSF9Bo6wc27
X-Gm-Gg: ASbGncuYiwOj3ueBoyNvQbDDFoNq25F36KslPzxAucsPW1Dk8dNOfZUceOjvWvwTQV6
	L8bt91rKLIUGLqcxVWKMJgdaUa9FLUnv+4ghCyEYz/BluCYNw7nvpDLr1+/bsl8KoEILB3Bwsc2
	hRP9+AiL41G7vJ+wr2kjTVk4EL3nky+tFKe1b6NXPi/WVKjdvXYpVxWfjdUJzMYblSadz7pbBr8
	+bj579c4S0DTnWJpKE3vwBZGDvvPZAYXZ6PRQ==
X-Google-Smtp-Source: AGHT+IEq/UMmHtvEHFjTV6aqr3rU75dwqokAcLaMPs1BUYiKg+1Kq8VdjmrOwCdpOwDBf43jQwfn1dVNnQvJg4H/+Mw=
X-Received: by 2002:a05:6512:238a:b0:553:adf2:38bb with SMTP id
 2adb3069b0e04-55a0464b123mr839180e87.46.1752234997377; Fri, 11 Jul 2025
 04:56:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709091542.968968-1-marcos@orca.pet> <aHD40TD8MLug0C6b@black.fi.intel.com>
In-Reply-To: <aHD40TD8MLug0C6b@black.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 11 Jul 2025 13:56:26 +0200
X-Gm-Features: Ac12FXwotDotbAAEV4ByRT27hF9yk5c_eYziBFRiS0eSLdauf0mtxz0b2w6G-is
Message-ID: <CAMRc=MeNo8sBToDu_P7SahMQcW1xGARgOyQdgJBf7LdtvoYduQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: vortex: add new GPIO device driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Marcos Del Sol Vives <marcos@orca.pet>, William Breathitt Gray <wbg@kernel.org>, linux-kernel@vger.kernel.org, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 11, 2025 at 1:43=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> +Cc: William,
> who is an expert in embedded industrial x86 platforms and might help with=
 this.
>
> Bart, thanks for Cc'ing me. I have tons of questions and comments regardi=
ng this.
>

FYI: I haven't given it a thorough review yet as I wanted to clarify
the way the driver is registered first so thanks for looking into it.

Bart

