Return-Path: <linux-gpio+bounces-26042-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FFBB54D18
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 14:18:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F4125172A25
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 12:13:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B37DB30FF01;
	Fri, 12 Sep 2025 12:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e8Kx3CVW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACE93164BC
	for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 12:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757678747; cv=none; b=HqpxiVMRrMleZU0ON0JIPrFvxBBU9bVyY8MyC7lKS9sTi2PY340yIQPKvGfZfBsQHZxNyL08EGaXAVXD1KWsbQ6vs1VgeNsdKYeaPAg5nmWetKjIRBi13UEU9ei9wjDzkCaBv5OOiXD1sK/ddKg+0jAXrY1+3SQJK+4sUPm6JFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757678747; c=relaxed/simple;
	bh=2HZs3RhpADmvQOPZauIqpaCVKlWVA26wOATz0MoDUgs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TzekrFTIiIk2hCKSmCWBmVgc7jwhTMqQDsuvXs2Bj2Ehgcm8Hj0IDlPkplzBsVm4dftbbFYKq9E9iKPDWIqmPaU4I6c2H8NiAKvOvLC2jAwIKYBypNfGzaDPX/4da98RrHtZy5+vXWT/t80sYZvsOzRnN5RFy1w5F+LyyKnmxkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e8Kx3CVW; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55f6507bd53so1901113e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 05:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757678743; x=1758283543; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kQHCeemvJiUl1jquvWnCNozolzxgcKwBQKlns8lZfT0=;
        b=e8Kx3CVWKClpZe/jOnPLqCCawpiAGQHjLJUbFWb36707WUygXsEPM0nngZHkazd43b
         5B6TWEiCg2ei3IugXux39rBg3kSHTYd11vranMoIyX5GosnwO238fnAVmbVoN8TEq9N2
         c+h+ByEM6ex4SBPe/BEaobnT0uhPfcEy2LEbMRY5iUp34tfiLEma8ZHj6jGebqTc0CoN
         4x+1UH3T2e34Cta2rkpyxS9KS3e96HLEGj0WVEezxXM1KeyXVIONC/8a0v/MkeuyLeBR
         Q6hY5Cl0fTPy5lJTbRmNJEhXS8leRnJmnoYjEt5wvt+qFZpanIJVsC6NXBcHCESdTFwA
         bejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757678743; x=1758283543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kQHCeemvJiUl1jquvWnCNozolzxgcKwBQKlns8lZfT0=;
        b=A+gQ6EZjYKIN8xrhnXeefoTyzLB9NVEfwoWRB79x045iKJovKi3I/nN/A/YrTCmeGs
         /MlDMLEsqHfRSfk27LxwNOuAHe0ue+jjN3gEwHHIysV75/CmRUBf9COWM0fEQmuqXZ0g
         qJemSYjYyvL8kC3KiauOkIK0JzZ9szF4LAdVZ3M2WBq4InqSRlVccL/aGBzPRfkBmv04
         +V9f/2hu5gAt1e6Wzan86SwJ/6XIxByFDeVE11DBuUIvC5LNXvxtX7fvmZVllmzyKqZ0
         JI7vpDl4tfzSVXX2zNjnctY1R4JXmgn2Foai2f+1Wo/GKrAq/dO3aK/yt1hCjegKlNwv
         ReZA==
X-Gm-Message-State: AOJu0YzHGFPaY2/kBMdzInw0aNpOgtD0jSarknLy/016s5AXHlrLYQvN
	Wm2xMDZ3GfaZIjrDIvKklQxtBFNMVjvsZycFtLGWVG4famUQ40UyFdMISF+VRE0PGopSt/pCyu7
	V7exyFCSwcEY+vfS12ij3df2zyxsUHj9hxAyKoG03nw==
X-Gm-Gg: ASbGncue42ueCwWSowDem9dSGyccdF07NwEoi9f4/ttIuHKBSJvGm6B5x4uGU+YgzkT
	uDYcrc27Fig/Ci1K+Azh+yrjsk3LMYbT3iH4Xdf06xwhXBiP89UkrPABr2Sl2lwxR4uy3MhKSdR
	+lFe22sMu7/fbt3G1vBbnQynbyBtTBqLzx09BPTkAzcAiLNvzV6Fbv0ri0DUm6M52B+xtCQjc1P
	VxHHCU1ui8tJVfbgQ==
X-Google-Smtp-Source: AGHT+IHJB0Rno3XXcsg4RApEyBhDouflUDi0GiuW0I0tWqkd4xyWJGM9sQOnJJjTWjRIva9RHRx8gOHAh7+9UsXKv4w=
X-Received: by 2002:a05:6512:798:b0:55f:467f:37d6 with SMTP id
 2adb3069b0e04-5704f5b1565mr747764e87.35.1757678743172; Fri, 12 Sep 2025
 05:05:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1757670094.git.geert+renesas@glider.be>
In-Reply-To: <cover.1757670094.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 12 Sep 2025 14:05:32 +0200
X-Gm-Features: Ac12FXx5rf1yv2w2VFCei6KOe_K45puo1mMdv5QraMtvJYmAHO--3JBHxkS2L5Y
Message-ID: <CACRpkdafaEZPfxi3CEhTSib6=aAy9D4r8-OC2+G5pL35Dnqvjw@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v6.18 (take two)
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2025 at 1:14=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit d1d31e2739ff063da1e85cd9b44316ca5cccdb=
a8:
>
>   pinctrl: renesas: rzt2h: Add support for RZ/N2H (2025-08-20 08:56:15 +0=
200)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v6.18-tag2
>
> for you to fetch changes up to 512bf60226c621893729605121a396240e84a5d4:
>
>   pinctrl: renesas: r8a779g0: Fix trivial typo in SoC type comment (2025-=
09-08 12:03:08 +0200)

Pulled in, thanks Geert!

Yours,
Linus Walleij

