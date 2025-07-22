Return-Path: <linux-gpio+bounces-23627-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC9EB0DEE6
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 16:38:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A0D03A449D
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 14:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 237AD2EA49E;
	Tue, 22 Jul 2025 14:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=criticallink.com header.i=@criticallink.com header.b="g8peOOS8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482692EA14D
	for <linux-gpio@vger.kernel.org>; Tue, 22 Jul 2025 14:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753194774; cv=none; b=sCgsfVtc2myLSEwiPktBsLcWZsSj4FWk0VrLJNGHHpqAHj+9vFcpmiTlzmo+ZnWmQnNnd0q/U3Ot3WgrGO8txx0z/97Gkl9OH29nQqElZt285dtvqFHLr2IxW6Mx1l1qH70BvO6iQjEh5q50cr8OZPJzb9g+0VMs+vx3PB/b1Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753194774; c=relaxed/simple;
	bh=RsyPlufZr31PVPnh/EWX43+9YZNSLPJR8i+ZYcSJ4Ag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=om74ZV6X5K/xeN1VTSYmjdzbDjiaaIi1jRABaIkv+gh/f/5ZjwxA1ylW6U3j/MHtIXE/TB+DeZJIkK8PoDE2cyGE5D09K0QrzedAtr+A7EIdtcJuZuQCN9jM1lnXvsdIc8+CbbIKOtMj645oZAYebQlSu+fPTCtyTsIVhMrFnCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=criticallink.com; spf=pass smtp.mailfrom=criticallink.com; dkim=pass (2048-bit key) header.d=criticallink.com header.i=@criticallink.com header.b=g8peOOS8; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=criticallink.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=criticallink.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-712be7e034cso54472617b3.0
        for <linux-gpio@vger.kernel.org>; Tue, 22 Jul 2025 07:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1753194772; x=1753799572; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iy3jvsb4tc1nMnyuXE7xVv3bbQGwBcqiT9b1E5knZ2Q=;
        b=g8peOOS8ecf+5OCnOfgRvCAK+mgnADuVd/6KlRsaeHpMDK9FdYWm76Yb3MGtE2DetK
         hB5aldX544w+KsL3a9dPArCjovkvTMnZagd9EUwepuMyD4hBX/b0U3dkV3WzeXBtm0vF
         +9NZJ8FkdpkG09MhAW+dDTULmSEc5vbjaM+EHXlF9dE2oa2EgM4QlwJxDrWG1sTobtbK
         lEsjSR26l2w+O6iJHXJDAvvEM6YszcRLexjC3eySYZF/ukRplm96aQI1uqfjtcJ0Kobp
         yWvd9/tZbtnVuxQRAJWGjC6Kpa0mSV2D/FtJAEEf3tMfjOpVa/LdHrMwcXiRGmqqBRhO
         /z1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753194772; x=1753799572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iy3jvsb4tc1nMnyuXE7xVv3bbQGwBcqiT9b1E5knZ2Q=;
        b=QOarfTfXFMd7xksWBZ7R4RWVQb1fOlc1CT7dp2X/K7x11y23QDKJ0cePpxB4idUrvc
         NOnz1zDyUazGFmWqS1Gef3pyY1roPvETcSgrTGukaz/7ILwVfjqFpycLdW6FA0971emH
         GKHtBpBnKVZM0LFy83It3l76qy1gcG8cFl3VcBDm6sG5Y69n/GpW6/lgrf1QNXJVH/gA
         uhX91JK5LND8P6MhcprUNJwwORK0+Me494Fk1D+pFnHSBXqYec+pj/wD4lAiyJx+VMMo
         tYF0pNK5GhgmEBBPlipOURJroZgzxlv4kwfXAIf5fFfBkWxQQOiVlaNqpwXnG/M1HpJb
         I3IQ==
X-Forwarded-Encrypted: i=1; AJvYcCVF5fKc00AD+pATxJwp1oGd/L38uQhCskBLsQAhyRTyyuU1240MpVxIwfZVJw5San0CibamJ51Lx+W3@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7ytWCBjJKUzKoEu9HIHK32HMqCaMEUVWKtW6VcuBUMWtPx5OE
	buK8BPw0+7Vf7jL0zAuLelLRKFLVyCxbrKVlP9uhow6mEce8jplUGMmH9mqnF+zMn+XE6kRIbqV
	DLAAs+n6+ZQLcTqeQve98yrr6pBJ2pDC+nK3nrurO
X-Gm-Gg: ASbGncvLkWqIdWrRUTEIX1i9sqtzx2QitcDaYa6HlQqZGbGb6kT4mxXAavlxY9rrHN1
	RkxKKb+04kgkEBbGpEi/SE5kjlQHImsgVLiWeLWFylK7aYOiHUP0hwtInHKBuXYJ0HwuzkQSzA3
	yz9XB4PHV6r3JBqDxZmcwVG/b5iGufDKr5U2w8en+HFfeNK0qRoLt0X5/CXC1UWWjFyI5OCntrN
	6YZCA==
X-Google-Smtp-Source: AGHT+IHLgyQbkmFbEUr6Uh7LewyrDsSpPOOYRIa+mMtbYtSMJpZG7OcUm1mC18zFZvRZ3UoLNegv8l+Q7RI3hzXSuhE=
X-Received: by 2002:a05:690c:6c08:b0:719:7123:ce3a with SMTP id
 00721157ae682-7197123f70amr165110647b3.2.1753194772136; Tue, 22 Jul 2025
 07:32:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250721233146.962225-1-s-ramamoorthy@ti.com> <CAMRc=McTJnTn1sf6Kc42yePvUyP87h1utJ7B_ynWjUxxm0E4Lw@mail.gmail.com>
 <CADL8D3YaF4zt2Wu0Vv1=8W9e9n5BKM+2npgfVmLhJ=wz-jHMKQ@mail.gmail.com> <CAMRc=Me7ade2aSJhn4tEAdNUvB3Y5TRLp8j8w8zgP5J3C6_MkQ@mail.gmail.com>
In-Reply-To: <CAMRc=Me7ade2aSJhn4tEAdNUvB3Y5TRLp8j8w8zgP5J3C6_MkQ@mail.gmail.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Tue, 22 Jul 2025 10:32:40 -0400
X-Gm-Features: Ac12FXxo7kCyXFb0iFwNr6tR3KknB8DInMm27gp30SPu0B8ZIwZZ304YZgGvPf0
Message-ID: <CADL8D3Zw9L+UABmSGdZio_Bq1Nx5tJ226EFtVY6DT3xgYBs92w@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] Add TI TPS65214 PMIC GPIO Support
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Shree Ramamoorthy <s-ramamoorthy@ti.com>, aaro.koskinen@iki.fi, andreas@kemnade.info, 
	khilman@baylibre.com, rogerq@kernel.org, tony@atomide.com, 
	linus.walleij@linaro.org, linux-omap@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, m-leonard@ti.com, 
	praneeth@ti.com, christophe.jaillet@wanadoo.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 22, 2025 at 10:31=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> On Tue, Jul 22, 2025 at 4:16=E2=80=AFPM Jon Cormier <jcormier@criticallin=
k.com> wrote:
> > >
> > > This doesn't apply on top of my gpio/for-next branch. Do you think yo=
u
> > > can quickly submit another iteration rebased on top of it?
> > Maybe this is a basic question but is there a rule of thumb for where
> > to base patches to be submitted to the mailing lists?  I've generally
> > been basing them off the latest tag in linux-stable/master.  I suppose
> > this might be one of those it depends on the subsystem things?
> > >
>
> I feed my tree into linux next, so generally using linux-next/master
> would be your best bet. The rule of thumb typically is checking the
> subsystem's git tree in MAINTAINERS and using whatever branch goes
> into the next release.
Awesome, thanks for the info!
>
> Bartosz



--=20
Jonathan Cormier
Senior Software Engineer

Voice:  315.425.4045 x222

http://www.CriticalLink.com
6712 Brooklawn Parkway, Syracuse, NY 13211

