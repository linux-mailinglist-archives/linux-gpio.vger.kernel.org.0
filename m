Return-Path: <linux-gpio+bounces-27347-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DC4BF55B3
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 10:49:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 475CA3521C5
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 08:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA655328633;
	Tue, 21 Oct 2025 08:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZVvVylep"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D260313539
	for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 08:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761036544; cv=none; b=kJzIB903SirDJtbaydHeymrqEBdm4hml/ml1K4JZ5G7/KsvumNreg4NOrfMUb70iHgmuOa+lLP6oRYaY+dkmvH57yVzEdhJFJgD9q1v/i0G5OPCezCrZQkAEQjrHZSBUFtECK1YKqYHzqpbPCSsQoIWV1xOwWYGBVM72BEgwp0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761036544; c=relaxed/simple;
	bh=XPoKmOvkORtTPa9NjvFga22Y6k1YtkHFkJ0SSvV1lJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P4dYXXgs0jhfhlPzaVjeIUMYTgB4PrkxbeHEV8geApwIyhX5WkhBKPXZ3OMe8Vt4yaCv1LY2uhomdOTXJl6wljcAAbuuUpYvornwko3OVc0IJcTauajPSxSGo2iMQwAqOX0ymDSjFfhzYS53ccdAYMEJgwOJsh0Rbgthl5ktgIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ZVvVylep; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-591ec0e4b3fso392009e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 01:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761036540; x=1761641340; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UWB7I3uOZH2R37zOj0nUgiboN1KhJcfYPAPWQf++YmE=;
        b=ZVvVylepYlIRipIxlYJ7M2tQIKLOhLUf4xj3CX7eETpiUVZ/SF2VzA55Wtt9jwm9i7
         3jlqyQLTYjFlfHGORHSO9eP4oLxhXRzAA95V3mwhyVan97pV2MhOpA15rUv5OlDUgTEv
         rlxvpB1AapIVPOnzJvdcVZNR/juJDS/c5rVmnS2KoFnr2deH2MWcg6RptvXuX09Ucbr5
         hyDNxItrTSTaN9aodWlRoZ6kS/kgREKf4M2iLMheUR1Friad90qBZVAZKuz0FeFXeQW1
         IuYsPkUg4aUfpzQlAlVX7E3+Kp7j3Qc9sFb8qnYVKsCrx1iI5bSoNHusrObEj2/dICws
         w6Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761036540; x=1761641340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UWB7I3uOZH2R37zOj0nUgiboN1KhJcfYPAPWQf++YmE=;
        b=g/0/G7OLWr6m8YZ2/UHzUNwxC8D4YKpIkaitbC6gDc7s/F4AUxK7YjzMYmGs9Erb4t
         UOyh6dK+JYIYiCpYKVhKUOOg3Tte6XRDwe97/9CrMHutFNJco9KBl7EQc/pO4wp3yURa
         7Wp4DY+2aDeW9ZGRGgBWzyTfHi+RTt5mx9QMHuzkm3NaVKGPvfieD412qrFmzQGfR8uK
         bMyRgAyY3ODI/jctBS3FTImFZooIRMVB8pbpBiJbZFxNG6BjEQQiaf0P7V7vXNjRygNt
         F7YqqWB6XmrMEV7egC3bEtZ5SJVE8UmIyV4iD/25rQw8W+Ip45kFmbu1QOE9Ty53edCL
         DjgQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4/9qzxfsxfTvvsiFjMeuuEMYhTZC3MZnBW2XEZ6SS4Ys1dYIh1+Jry7FWzd2jXiFTkKc/QOC0z4EA@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+LnRHwPhu+YA3rJEoo02sCCW8nUzZunKxI7iutHO/gQTKYTbd
	dfTF0mF227iEyIXzIisMvzh6ntJFgnq4gMDVy+5EdCvmTF/31GwdtdiYrSLto92rB4O2Eo0m3wc
	GKENSWYnCLeRp71hCGpt7FEDPVvJohmLzKDBhY0fYTg==
X-Gm-Gg: ASbGnctCAX6uXGkRYgY7oqfZ1VCejm75hf/ovWbBwjN4Na218AQO8xkhgmh4wJtYzXg
	qF6Vj3fSfQIO64M1D7aqpSKWHWJDiGMH7QmolK7vSyGwv+fiXdt8RnsAJgdKoXm9s0hrB3h4B28
	otQlFbCqaW5iQt4X+TTrth10b3y0KVyg5PHUb35ID9/4y74z8SgXGN+li7Xe48NK/rZp/5Nu/p8
	cN5pO6f3udvt1iTKra2j2Yl5hg5v6Gso6DTRJefBFDJJ/ynBA3aZN2w+Pt/iKVQEBIziAydBFwO
	cR1w1h1OVwQdLBWSDiib8E2j/gM=
X-Google-Smtp-Source: AGHT+IGhse0+b3CMkpG2vCzGWzQdyEVQTxsJwBmPyyMaoRdINy22RkUY/oSul+AvEUV91IDbfefUY9oqSpF1cwaoD0w=
X-Received: by 2002:a05:6512:23a2:b0:58b:15b:21df with SMTP id
 2adb3069b0e04-591d8533c83mr6150254e87.32.1761036540599; Tue, 21 Oct 2025
 01:49:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013174319.GA847155@bhelgaas> <20251016163618.1355923-1-vaibhavgupta40@gmail.com>
In-Reply-To: <20251016163618.1355923-1-vaibhavgupta40@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 21 Oct 2025 10:48:48 +0200
X-Gm-Features: AS18NWBHxy0Kh94MMHCmN-r2YbyHV5c_I_gws2Hy0s5QMWm9HV2uo_-7iwXoW2I
Message-ID: <CAMRc=Mf4FnBoZfdR3gG47te=X53jASzb6MVnUmNw2q1rtUwxzQ@mail.gmail.com>
Subject: Re: [PATCH v6] gpio: bt8xx: use generic power management
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc: Michael Buesch <m@bues.ch>, Bjorn Helgaas <helgaas@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 16, 2025 at 6:36=E2=80=AFPM Vaibhav Gupta <vaibhavgupta40@gmail=
.com> wrote:
>
> Switch to the generic PCI power management framework and remove legacy
> callbacks like .suspend() and .resume(). With the generic framework, the
> standard PCI related work like:
>         - pci_save/restore_state()
>         - pci_enable/disable_device()
>         - pci_set_power_state()
> is handled by the PCI core and this driver should implement only gpio-bt8=
xx
> specific operations in its respective callback functions.
>
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> ---

This says it's a v6 but I have no idea what changed since v1. Please
provide a changelog for every version when submitting patches.

Bjorn: does this look good to you?

Bartosz

