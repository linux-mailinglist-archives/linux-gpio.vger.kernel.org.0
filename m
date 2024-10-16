Return-Path: <linux-gpio+bounces-11464-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A88E49A1263
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 21:19:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EC221F21528
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 19:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC935212EF9;
	Wed, 16 Oct 2024 19:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KUKi1zzA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C7F1B4F2F
	for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 19:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729106379; cv=none; b=osjgdodiOsPSS5+I+yu0aXPbJ17xghJunv324oh1TeBQG9ZpXko2DXnfBY5YQKgSdoPLEuOgkUFhUFx1RwynU3tfucQ3Q2AV7FR44BaLs4qGCrXRhzYzvyjlOruK16GF3RSbkVgNquYphbZ97/LhZEiogAy9kURZu1zNi+n92bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729106379; c=relaxed/simple;
	bh=gtWZ57ExWD2PHqmmnLkGS90BcqugtcrCTflStn3g9yc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YBBJT9iy8sIX434jR2MFK/o6AtWOaNzJS79HR1/JC0StJMm6xZ6xxi8sGRsu6pUnrB2Ia+0QGYYwsjqDWgJ0vYJA1VNNZjFCRnAjwW9bSwHPnc09h4/4iaKVWgC1grnCCHGB1+eP+yXqSWkBsk+8Fr1ZKzBVYlwhh1Mj/I3D5Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KUKi1zzA; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e2e3e4f65dso2863317b3.3
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 12:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729106377; x=1729711177; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gtWZ57ExWD2PHqmmnLkGS90BcqugtcrCTflStn3g9yc=;
        b=KUKi1zzASNbg7wo2MxkXo8AL8Hg+JULd1BND87EkhITigsjSeO3oGHuTKEZ3y0s4Sd
         6TL5AbgFwm3TQwKLSUQchhNpzBjM2Aaf/jyWZ1+37jhaU4nQXp5Spnm79cDjO0OXVux3
         ixF15ogc0SbBTMk652Rf9AkwtyzpPtntMQZvnZxey/SrXc9Pt8hSpIQo/kex0cKnE0/1
         48o3wb4QoHzaxiHLC7uHAobvDtVL7SViQxZ06V8E0TB2BcJi++jztNa1EwYwhSdrX3hs
         EK2CKRwlFUOeP9pDmrx524xPfH7kVatKRoHz4CvZqa77PQwt7B01MH6PWRlNnr5T2Xua
         XPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729106377; x=1729711177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gtWZ57ExWD2PHqmmnLkGS90BcqugtcrCTflStn3g9yc=;
        b=WjkwJFDgdTPi3XYSFhZtOBXHUWPhWis8cRdMd5nZTK+K+5mXZHEjmEfBU3igQE4shb
         ZtU9H/hJlCLUEAbVzwUHk+5+xtmbcTPtfNmehEJ2P/74o/nfPRXKcRtVzEUZ67CHj+AT
         /3sOmlqINajtT+oddKqVrPeTubOdWAja2ZPKoBLUXFhkcqn7nQIZhHn4yN87IFHya9L0
         18N4Jj0ADZZJmmaD+Wv7P/zWw0G5MKH8CjMbHFzQHahYYOpRYwRY0itE3vgwlbD4Xlez
         zW7ISUxJoofhw97pmHmgcRk6pAhmn5l6ypW+j4H7dJm4wCEXsw6n0KrlYFPhSI3gO+Fw
         pMew==
X-Forwarded-Encrypted: i=1; AJvYcCXusWzIyFTw0sBN0wgN04cutM3VKXgAbGWdEqvZ+gEyS3WMEsVvvVWmfcudciwCKumLNSoPd+HfR0IU@vger.kernel.org
X-Gm-Message-State: AOJu0YzX+p+4spVCljdIUjtdYks/bY0erTwYAJeGAYjBxHL2eokRNi4l
	T6i2qGVIR5mW3HF3F+6FfcuCxBHHaAUMYC8ZsuGLwmlN4E5slMaYUafq+WFti2CFvw6pnf8SKU3
	N0BDwzO1gT2zffjg5orIFRJkAI5qksOETffdWDw==
X-Google-Smtp-Source: AGHT+IEACI7dCsZ+LPTDbAYuvPfOpNLnpU0R6uklegf41UhkmZvuMGnR17uW6P3AkUMLKqr53UrTv7Hr3rMXxjZ3dno=
X-Received: by 2002:a05:690c:fd1:b0:6e3:21a9:d3c9 with SMTP id
 00721157ae682-6e3d3f83820mr56114757b3.9.1729106377283; Wed, 16 Oct 2024
 12:19:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241016-typo-pinctrl-sg2002-v1-1-2bdacb2d41e3@bootlin.com>
In-Reply-To: <20241016-typo-pinctrl-sg2002-v1-1-2bdacb2d41e3@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Oct 2024 21:19:23 +0200
Message-ID: <CACRpkdYfRgtLX4oNubcSuHbzzFr6KPLYQ9F0wXC1VXm4U1780w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sophgo: fix typo in tristate of SG2002
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 12:11=E2=80=AFPM Thomas Bonnefille
<thomas.bonnefille@bootlin.com> wrote:

> Fix typo in tristate definition of the SG2002 Pinctrl driver.
>
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

Patch applied.

Yours,
Linus Walleij

