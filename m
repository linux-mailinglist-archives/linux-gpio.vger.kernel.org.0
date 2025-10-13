Return-Path: <linux-gpio+bounces-27009-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 37492BD27BB
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 12:12:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2738D4E46D0
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 10:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A93362FE56C;
	Mon, 13 Oct 2025 10:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CUGnC4X0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4A12FE042
	for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 10:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760350329; cv=none; b=AT6xdoxTaWYeEdG8duXsVIxdUwKysCPe4R781ELYNLu/GlUgbGixw8+LTrOry6iPsPk+wl7xPR0pUzZLNhK6LnPaeAggWmeVWl/3bQCSKIEUDoSiD82KBnDs9LxcGb9GBsS2gI3a3IQtYRRWdbPKVv4JMHWqLz197zBnjjoCR8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760350329; c=relaxed/simple;
	bh=RdLBpMQJKF/WdkdrgqI4Lr7gfqMU0n7ItqvnZUJi0J8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kndVCOi0hYOAAcp0MW1AH05RMtaJkcV1tSRFWEQHa3q6myenDSc5YTyfGFcsXAVRngN7v697PzQ6j6DLu0jjegQhUCWLMrmWMAmDaFWS3J2AoOj5t6pmk7R6D8sXrJf7OUzlkKqdX626/LvniTEXWfARSl1q19wkG0GZ8HS0plo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CUGnC4X0; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3635bd94dadso34136431fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 03:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760350326; x=1760955126; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RdLBpMQJKF/WdkdrgqI4Lr7gfqMU0n7ItqvnZUJi0J8=;
        b=CUGnC4X0LsOZkm7rzFvtwdsjj6i83AeVSJNOz5RIM4DJRYN8LBvQ6SY88Ij8C/gf0p
         wfUAFCFvYRNAqdY8D1FMDD2Da6OULjDiInNI1Hz7E/GOqVlmHXinYjYSnx7hKkLjcVRe
         q0dRljoa41khBHal6ntClNRUsFENEfXDE+06lS6I67lPmR40tMtprJbP7wjiiX7/036X
         nW/vuX40nSpbLby9fIhcbx6/frqTlWhnV+V4Lb3fXyShDH7jWw1sEDhUgFeEwhgKl7XG
         QZWB5INAuqWYZLXmhwjZcYMwBQMnzXXKImYY3gXbIJLklDoP0rMsMO/z3YUONCxQRO1f
         +dQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760350326; x=1760955126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RdLBpMQJKF/WdkdrgqI4Lr7gfqMU0n7ItqvnZUJi0J8=;
        b=G0+RritBtwnyShCHZIatA1PFL96ApeDHPMJYj26XSOZVzpokVpV8woXC61xItoqnBJ
         40Ha/JXq5q/Y55ZEZ2XfvnpvnB8wSQS2M5qWmngbcRMCHtSBA0YOK84VldKnMqw4B9j2
         VxplPA81kjeyJyX4srcUcCbtJqUaoG8+DFxuJY0qoEC1D+JoNaM41gy5M7oeLR6FTyLe
         GluO1nHMjK1Ze48vGabAkgbb3fDvnsXVe1YFx/mmPgVBAS7HJM2cazaLjJWNJ2POa2H4
         FjycauxkRJp5J3RkKgc1WLqJrooq0t7ByneoO8Wqe3CyeP2DyzDXM61kx1j/PGyYzg27
         xbRA==
X-Forwarded-Encrypted: i=1; AJvYcCVhIPW88TOG5OJO5rS1uDONyJmMPZvn0SXCcd2KCjR7likwcCD1ulzU9eKgSzC2nC3n2CQvOT0nA1OD@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzz52DynsN3R/X+GK03wbVXmZejLnfGz+1BZ+sSKWP3EboCL/c
	jGTbjtw+1p1kr9tPCwfKmObU1akogfyLjCYRltHrByz33xFIWMAbIrxGvA515g7Frg69eWG7lP9
	8F0VVRnBSOAyu3gUVoNvN9ct4Wy8qq7S+ZsiTI098mw==
X-Gm-Gg: ASbGncviUPH3GHOoiOaeoA7IUjAq2+DoEuYn/sEpmY7Ctjvrq3SH5zNRGLTghKBQ17v
	+4Qo3tMxqPCFa+oVjzROs7BtH0h0r4brKkKfb4OWt32oLbO+qZvnre2RiGlYgKuRswZ6s8B4U8b
	Ns/SKTeEvwzbf7irIiBQeOWGX8cmExb+ERQNBzzfCIWvEHx/LlJCN9te9Y51VKUYa4JFNcEdZYP
	LnsDl3RjlemNNn1xYKlYF1/FrSdi6J8dSgfn/3M
X-Google-Smtp-Source: AGHT+IGgRJrGAZEzxavCYvBvMxkV4C3SuTl/tY5kwvQvzOJPw8FV39401eLsZgGg76AQQApcgWo2R0o9i9pCt7zAw68=
X-Received: by 2002:a2e:bea5:0:b0:336:b941:4ab1 with SMTP id
 38308e7fff4ca-37609d788ccmr52889461fa.17.1760350325946; Mon, 13 Oct 2025
 03:12:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250912-am62lx-v6-0-29d5a6c60512@ti.com> <20250912-am62lx-v6-2-29d5a6c60512@ti.com>
In-Reply-To: <20250912-am62lx-v6-2-29d5a6c60512@ti.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Oct 2025 12:11:54 +0200
X-Gm-Features: AS18NWCXTgDlcXu1qYOFDjPkHsaBIb9mh58rrY4q-gih-VvDw6C14D0uT1gunyA
Message-ID: <CACRpkdaG02uXd8q5shNJ1LS2R0hV52OcQLY0MmXoihJYU90zWg@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] dt-bindings: pinctrl: pinctrl-single: add
 ti,am62l-padconf compatible
To: Bryan Brattlof <bb@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Andrew Davis <afd@ti.com>, 
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2025 at 5:40=E2=80=AFPM Bryan Brattlof <bb@ti.com> wrote:

> Add the "ti,am62l-padconf" compatible to allow for some changes in the
> driver in the future when needed.
>
> Signed-off-by: Bryan Brattlof <bb@ti.com>

This patch 2/4 applied to the pinctrl tree.

Yours,
Linus Walleij

