Return-Path: <linux-gpio+bounces-10852-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F2D990525
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 16:01:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38334282B5F
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 14:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 239391DC725;
	Fri,  4 Oct 2024 14:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sat.qc.ca header.i=@sat.qc.ca header.b="S2R1eqXv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7248E20FA97
	for <linux-gpio@vger.kernel.org>; Fri,  4 Oct 2024 14:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728050442; cv=none; b=NkgDPU5eXlTzkBBAbek/RocxmxqMqt8tfh5z7QGwkxpoBoiUGzMlDxWe66gwZ4ddmFFWdgKYDhLQZ5P78sAUbAWYTQ36UAmCsWubrV3FDbIiPuV8O7GRFpv/JmRRRzj7Q3jHsR1BtHswt2Rm42EBrYPJlReZ7AZpdiTfI8PyKQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728050442; c=relaxed/simple;
	bh=f0M+OV2KjhiYuRqTyYE0CHMEYxU2OqX3JypWv/UAidw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 Cc:Content-Type; b=HNAJbg7KLTpESot15KcsLubmp9y9h1iu4TS2eDWEacT/cDB0XIhTfr+XMlShnSKvz0pZtnppzwIso2h4QNr/QtsAJLsQ1mnzM1Lvu7aPZUjYmIgEX5WXVHLYu7MdQOIvSZsRz/ni/sRyiPZSxlbNl78uQWMApz/nYNGQM/rvqTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sat.qc.ca; spf=pass smtp.mailfrom=sat.qc.ca; dkim=pass (2048-bit key) header.d=sat.qc.ca header.i=@sat.qc.ca header.b=S2R1eqXv; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sat.qc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sat.qc.ca
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-27beb2496f4so800896fac.1
        for <linux-gpio@vger.kernel.org>; Fri, 04 Oct 2024 07:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sat.qc.ca; s=google; t=1728050440; x=1728655240; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0M+OV2KjhiYuRqTyYE0CHMEYxU2OqX3JypWv/UAidw=;
        b=S2R1eqXvukNpi+h41ZISFlR8v4iX/UMKkO14KGdL5IuoVs7eZdFpigFrqKIY5jsXVm
         cUo3MQB9pq+TtR8voXmEZ7owxlN7PWir/8WaE17VdPNqw8X3TifcOQc5Punzpr7OKrA1
         ME55sl31ANsOGey0Gl6x1HWSYvRxO9DbYKaltgbMXFgsu9NhBsW5w610hZ/RBFNaHJuQ
         zbyz2fetkQjDQvN0VEW/TKxmSskgExRjHJ1KpYrXajXOvsVhBd/aE8jMGDoiLRJm/+Cz
         7RVTpK2vX8mvhAK7fbIxudBWMgVZ7tPXjJE5vNWxG2I2O3fC5JdnWz4/t2Wmr1FzivW7
         MB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728050440; x=1728655240;
        h=content-transfer-encoding:cc:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f0M+OV2KjhiYuRqTyYE0CHMEYxU2OqX3JypWv/UAidw=;
        b=kyKJDgtjcSt4/v4Wk5LPH/okbLRwuZjc11ezYyhNPHR4fkkgdEhGydRJRrG3NDYo79
         DW9dKw1M68Qu/jnyyALYkOKDyx+rkQ83BAP9wBBdS6siQlXMlryLtwS/e1+v+mWgS0v/
         Jn/h2E0dXenERLu5LyVVGua6nVRG5A+orNSfsOlzvXvEmeFizpMC/afVDuGNx0I8bxuJ
         rjljTnAZj4XOM9myUeblAmM6QhK6d/EWC1sZEa7n0xmillN/3l/jIUYDN60ACP4eDWTp
         Ulv0m6nyzYR4L8V8NYXY9pImFGDUMK9sh1nL3RuD0CvKaTRsOWFiyruMfUHIR3duBTFR
         BC3w==
X-Gm-Message-State: AOJu0YzaGguM+Xv8NAlJbmroPp2ZiKOvq/A8nH+NT7t8IjdkK6TzM6hZ
	a2lkBitU1wxavChjKpPwdcKFTFykTNE0KAtWv7iVKu/GReKlR+wE/wOCKj5emOe50W5FKjOc0iZ
	8r9lkAMb4A00TKGhDe0jFDDvV87fw3H268V2oquUVTdElwWM2fR/jv9ft
X-Received: by 2002:a05:6871:9c17:b0:259:8cb3:db2e with SMTP id
 586e51a60fabf-287c2309bcdmt1764708fac.39.1728050440436; Fri, 04 Oct 2024
 07:00:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAA=GyxYyTvweUa1SWGeHkdtRRNuhFTri8cPTrFQY6pO+84vS0A@mail.gmail.com>
 <20241004070655.GA60749@rigel> <a2mjcu4g6z27463yviri7sozmyvlxntkviz7r5lkqjhimbiwfi@fgdthlvg37we>
In-Reply-To: <a2mjcu4g6z27463yviri7sozmyvlxntkviz7r5lkqjhimbiwfi@fgdthlvg37we>
From: =?UTF-8?Q?Jean=2DMicha=C3=ABl_Celerier?= <jmcelerier@sat.qc.ca>
Date: Fri, 4 Oct 2024 10:00:29 -0400
Message-ID: <CAA=Gyxb7AEqARgsP=41bN7=H7Vx0RvOzEcFRdNfRBj-xCLzOsQ@mail.gmail.com>
Subject: Re: PWM-GPIO driver: how to configure it?
Cc: linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, my understanding is then that it is not really possible as of
now to instantiate this driver with hot-plug USB devices, right ?
I'd gladly look into contributing a patch but have never contributed
to the kernel and would have no clue as to where to start.

Kind regards,
Jean-Micha=C3=ABl

