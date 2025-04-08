Return-Path: <linux-gpio+bounces-18474-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5E5A7F8F4
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 11:05:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85B651887202
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 09:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65EEA2638B0;
	Tue,  8 Apr 2025 09:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jCTCf3i9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B273320B815
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 09:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744103151; cv=none; b=X4bO1V6K8zeaTjdZmXkDvKknGShrH6jmHgi8pnkp+i5f3TNeGmcSk+SvXQ9IQkUEC43CjG0tu0xLZMJeDgkduZ4gPyeDuZxj3fb6BhKkVrMVe5kFrX/EZRNV/WUwwordD9OS5vlVi57VEpVH8Ff808YSlTqNXcZUj5JxmzXXObc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744103151; c=relaxed/simple;
	bh=9mAxb5feoE0Ny0tBUP8tdL4TkjKLrJVrOw57UYOVu9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UaMQZCTQ/KiLK+/xaqf87Km4s1Jcid03aCqrq/MGh5JfrFoALBjOMGX09dJi1aJelUYV9LRA/nGayKvA4vou5Cy5n9Je2281yy/WTd3rXInvdOmH7ROPnloFb0DcOOnd8tR4Q3/bVYj4F5vhKv1uHHCjArUH7ZCtbCJv29U28vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jCTCf3i9; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30bef9b04adso50035961fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 02:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744103148; x=1744707948; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9mAxb5feoE0Ny0tBUP8tdL4TkjKLrJVrOw57UYOVu9U=;
        b=jCTCf3i9zkd10PSINjiYzd4x5hTMFv6cLHoTDAQ2acqfo71qX4tlomTDr3oCKabH+h
         KlXFS1ZwVodShezmcM92mTLc18FD1UFvDqsURf6u6kHni2ATIShRTxF4G/BKPmF6nUxu
         LY994FWsa36sh89WzU+PVmhadc2wA4sgJdEIIOPCfzjRT7hbYOuWQ5S4ZjgXa1wJ/hoy
         n79rM4CdkPLiZNxCoxANhoAoFa+4E5uAaGhQ8CCUwdiRlrp0vIpE7WYub4to1TsxRvXg
         T+D6IgxilpV16qUwUl/VgrYDGS5oisX+nABsuOMbXHm/SLFdrEPilwbjP2CL91Lz1NQe
         mMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744103148; x=1744707948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9mAxb5feoE0Ny0tBUP8tdL4TkjKLrJVrOw57UYOVu9U=;
        b=KndYYmuaxavmwnulaf/CKB939sq9r2AoDM6KTf3WTAfxKArvS2r52LOUC79TJPOnw+
         56QQmVzj+epFLuCClOvBVSWx653AYWq9MX3gyD1ff/WGJyb2jDFvkpXvNR4bdkq33FhH
         c1w6dHC6wxKOvBjAlzaHCvO1l+HVIUBw1pXOJOQ3B/PUzWgpbEOFl4YBJK6t8tjKnO+O
         9JL+6r/aXiDWk6Gx/SNzuh5VvRUJjahnZTpL0jzIeXA+ukKhYGqVJgflaZDNROqOrIU+
         /foKKP0n2YNL98aOXHb8Ctdku73r1fZWWYpbZA62egYVPdsgjM6xFt7awx3uY13bCPDr
         bdOw==
X-Forwarded-Encrypted: i=1; AJvYcCWO7XR4k0/NdeP08WqiI5/6hmt6UJsn67UWgLZPFXnzECdHX5KCW9+4Ra8MvOFssfs0a0v4C6/YmsDZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxPvJ7ym05EwSsJ2tw17NTTNb3xMVsSePNifScz2sclpuVeWIPn
	fvSmbKTin9sPFXNDhIknSYsv4tCleJH9zpJCPJ+jeFEt2UImqO8MFudWO0UQIkAP18nANxUTCQq
	pKdd/GjGBq8AoI+VjCP6p25PGoP35o7E98M/1xA==
X-Gm-Gg: ASbGnct6MqGFnf2GlEGjFVRV8V0Ud6PhjNC5a+7ANTOIEArOx+eKO2TiH9gT3/dNU58
	bkWJ9WRdV+HAPbFrfgc4/IhU1Y16wsc0MWJ/1jVF6UpCpeM9ct9OYAXs984SDVxL3HH0+dd05tl
	MsFAPVOnwC7XTXErkpgLaDbpIH0vJ8X7HhHjpfV9Biw1lIg1vudxkFZQ/py+cAQPQ29qQk
X-Google-Smtp-Source: AGHT+IGv7/tVX/9zm5BciYmQt4+6czjZ3tL8CxZuYRul1dMr4A3pb/LmiH2xn1ZK/3Wmk0LPofeOGGww9RvYOphOdWI=
X-Received: by 2002:a05:651c:896:b0:30b:d5ed:55c7 with SMTP id
 38308e7fff4ca-30f165b0ea4mr38935231fa.36.1744103147923; Tue, 08 Apr 2025
 02:05:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408082031.582461-1-jindong.yue@nxp.com>
In-Reply-To: <20250408082031.582461-1-jindong.yue@nxp.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Apr 2025 11:05:36 +0200
X-Gm-Features: ATxdqUHAa7UVbGoJunzY0xoW-ARJdBXka4xQ5saOkppnRcZ6txjqtbwM_fD_Y_k
Message-ID: <CAMRc=MfuHs=7vda2CaMzHfVDXe41TV3u3ezPmt38xJ9=8JD1sA@mail.gmail.com>
Subject: Re: [PATCH] gpio: vf610: Allow building as a module
To: Jindong Yue <jindong.yue@nxp.com>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 10:20=E2=80=AFAM Jindong Yue <jindong.yue@nxp.com> w=
rote:
>
> Change the config to a tristate type and add a
> module license to support building it as a module.
>

I can tell what the patch is doing from the diff. I'm much more
interested in why this change is needed.

Bart

