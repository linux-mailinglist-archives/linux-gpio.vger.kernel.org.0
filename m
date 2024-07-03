Return-Path: <linux-gpio+bounces-8006-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6755D9260AC
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2024 14:42:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99A0F1C21D68
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2024 12:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0477176FD3;
	Wed,  3 Jul 2024 12:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="coALAr6d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8A017625D
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jul 2024 12:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720010538; cv=none; b=iFX65dPLFLELN5xFYtkMl5d0HhRKjDihibZV9/11G36mWz6dmlUX1ugoXJKldp5MxbjPeanDWJw5lBzKrCtAvqxdyC5fN0KGgpDRyZUT+mT1gMVT9Gj3Oxgouu+bpFbAuuJlqpsG1YfIB3bXiiNy70OBQ3Pn4l3UEIvBbRKlHN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720010538; c=relaxed/simple;
	bh=WGy9HnHtG0sk7gbF5+taydKdEFXh/w2zbWiiG26OMSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O66JROOb5G+cOKYQk3Nn63g3vq++jMOzzgFTNBj8iuosiBwkv0DBXbzp5nz3Z9cCqHNjviePKsF+ThSDNyTDyNIIsc5Bf2E7URFwZGrOXH73i90PR73KLUNWzkMSeb51AtMDAGoVM7n9UhxxZaS2ywEssmrV+JxvW/hdm3yu7qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=coALAr6d; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6519528f44fso5182107b3.1
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jul 2024 05:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720010536; x=1720615336; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WGy9HnHtG0sk7gbF5+taydKdEFXh/w2zbWiiG26OMSQ=;
        b=coALAr6dH1P0fxAyBGJOf+nG7m+tqGwxvOfmJ2OX1DyaGkoHFFc6fM4iVyKRG1QkMF
         +Ski73Y2v4uIuMytuaLENrMyOw4sxhAfesoT3iKmk5+M2Zd1QPhYOaSy7l3vr86JgwWs
         Dp8okJ1WU6agFZrilJrwOm9wc7D46zTRJldhB8ed4II27nELhz0Jg7bxjPpkjp1z/JNS
         4ap+Hkc1MD69RucY0v3hINjqft+5OawznOirGHHVK89CD3p9d3B9jzWabXqrwhHErQWN
         rUCQ8SZuAllqy3enWEldTr1EA4GLAwWkbxtACPt8wQCpDTlHyyyPRz5zbOZLli1ofBWa
         d+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720010536; x=1720615336;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WGy9HnHtG0sk7gbF5+taydKdEFXh/w2zbWiiG26OMSQ=;
        b=ePoAO2h3fEaijuTsUCer0QB3xGyblxlQ2r9hsdD5WMukK8cDCcko/ap08Q04RnQSA7
         jCGdgKF+Dd8EIsiFNr22akJgtjyJHdCv5RE5nSCbdW+cSA8JwXbZaEyV4etYskhbHIBM
         9L0Y7yI/hsvaZ0gmTnqVQmpk3jGfh97a5adRqYXBzyu0utPaFG8cl0T9YDUsF5aLTg/v
         7in7xH0ap9uN5NgPE1fePrWDZ1Rt4RYv62JviIHUmRtaqnzKK/GarEHKMyuAAJgr26Dp
         iaDXLP8L28Hs1OGWC6/cfSU1nD79r0WUOqP4yMZqnnxHCL3IRUfAFZh3tNgvDfi/wR84
         WTwg==
X-Forwarded-Encrypted: i=1; AJvYcCVMw8HXVcSXOizf67pUQN+m9rlysl1YORUYw3QWLw5qklAyso4MBxjE995BGvD6QBVg08TCz/VA7MjBz8tOxPUsG++Ky+XelNQkYg==
X-Gm-Message-State: AOJu0YyLgwFdHtLy8obybVXLX/PnJoJ1Lo9gcIpu335ZE0rOi5L/vSaE
	5PKQfHqSRNZHdBfhB86z1wZE+HTn/Tefyc09xCCmkQZRGfJcv1odenHhKaueCIP477TlJ1fepeQ
	TDXINEhQz3OvbKpO2OvkJ8PYhDNxE8rH2k5fcsg==
X-Google-Smtp-Source: AGHT+IExCk5Vq7oaEX9hYErcWNt/jn8F8v/b3cmMK80gc7WrrgnGrV1BBcszUD1l2ZP+IAdB1HfikZckPy1bcw1vcGo=
X-Received: by 2002:a25:df16:0:b0:e03:229d:69f5 with SMTP id
 3f1490d57ef6-e036ead1e52mr12491370276.3.1720010536270; Wed, 03 Jul 2024
 05:42:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240627131721.678727-1-peng.fan@oss.nxp.com>
In-Reply-To: <20240627131721.678727-1-peng.fan@oss.nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 3 Jul 2024 14:42:04 +0200
Message-ID: <CACRpkdYzg8jE0F7SHo9-WoyfvHgEwkL5ouxX3vSj-qdq1JX97g@mail.gmail.com>
Subject: Re: [PATCH V3 0/3] pinctrl: use scope based of_node_put
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: dan.carpenter@linaro.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org, 
	kernel@pengutronix.de, u.kleine-koenig@pengutronix.de, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2024 at 3:08=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> This is to send the non-applied ones of [1] after rebase, no more changes

Last three patches applied!

Thanks for doing this work Peng, it's really nice because this kind of
stuff tend to end up on the backburner for me, but now it gets done
with proper attention and focus!

Yours,
Linus Walleij

