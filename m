Return-Path: <linux-gpio+bounces-21039-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E26ACEFAA
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 14:55:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6ACA3AC888
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 12:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1972D22331C;
	Thu,  5 Jun 2025 12:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sBum1WoZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E0F21D590
	for <linux-gpio@vger.kernel.org>; Thu,  5 Jun 2025 12:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749128129; cv=none; b=j4n/8PPmvEBtDKqok3b5enttzhLAtCJxV2lWzuxjg1TUrZ/VWrngX77NYyJUZTB8lEjRVc+5kP1DatzlfypGFO4zIBljch+kGB1yhwDwii+Jv6asijQwMifBNLAuVp4K0CceqVQbdEGVjmV5HemgOvHEZ73u81I8AY90D+JaHKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749128129; c=relaxed/simple;
	bh=eIIQM7TR+T1o+dHAZkYojtv7Dh1o+Bo1e/gCVkYcYrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MmDBqW4RFbUwUluMS8/3j3uR5o8K0//KoeiFndYvhqizgdW09ikU3b7o+gP6ErAYQMmQ7Y549q0ontqJGB8fchmxOwGmc4yPlhUvu+be28Eh1BIia3GYII3M9GQ7S/QoSYoOzAzWRDDLC8T5eBIovqk2sbp1eQLIR9Y6iO7+MC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sBum1WoZ; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5533c562608so922272e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 05 Jun 2025 05:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749128126; x=1749732926; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eIIQM7TR+T1o+dHAZkYojtv7Dh1o+Bo1e/gCVkYcYrE=;
        b=sBum1WoZ3z0r4BE7gVJLZuzsycj7D4rrWlW19JJUORC6Z1/IjLlfeSq7JJI8sOqQyF
         A4fFs4gzFDZLFyalN08Vuhyo1Ay4xZah86ix1vMIwVdh3NkNaps3SuGU8EzaNWHoCzVR
         bHnXI+WMgeVx/fE2bX3qJt3uObzlq5iF7gLAoHpQ8kzUvDv+XiwKhiO/mfXtCEiPDEK+
         0srdlSqNT1oJzPywA7DcHBYTci/BpINtClXPO8cFDV2Jng956vIRUUGUrITGgzbYwuat
         Hl6mq/6i3rGDJYDd703evepjZjTtcRw9A1plNX6wIQhDjcPOgJtbbylWO1vC+QH6yixP
         H1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749128126; x=1749732926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eIIQM7TR+T1o+dHAZkYojtv7Dh1o+Bo1e/gCVkYcYrE=;
        b=rnHUL073+Mhv4VO052rhW/3U2UUCld0IOsgyQOU0enlkajxTyQhQVl7bEQ3EWx3x+c
         mdVN/XoK6RiRps3z5R9UwSVucc4FAXAPB539ohEKF18LlL1TfJB62MtRFczP+gR0UES6
         CNh0le5JM6MFm7KXF8I3/vIZekngOBsr0ymyz+fNrftxcIsJECrLRkGiOEgCQGL5FRHW
         nT7RJCGGijgbPMgUypfk/wvEd6i4S1kuN5BEhBgMmeGC4VhzCpJKDvyu93H3c8VLje2e
         8vu/bRzzYxCJ4ORkMcnjYE6uwjynv/3gKHCKlkVe0KYpI3bDKCdivoE8+7Psyqf915It
         mk/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXqZ0JE1arENh/oUaQuN60C2sZEcRUCGH79hbB+GMWzR0Ax3qBhfoB628O1HilrQ7aJSfL9pDG9pmpk@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1MG4r3XK6nKs15f3/fSl9+HNEGS4e6OTdAFxybSqrHLk85wYX
	8zC3NVQ11MIjG5/iEHEs1XiMKknnXlU53bfyUGZuFWGLdiCwTxNLHfszRTsd0fSme7lUuqU0F1o
	FshdA5zICDQjxKngvPgl/rf8/Rj1PvS2dwsw13jDdSQ==
X-Gm-Gg: ASbGncsuGb+OXqRRIrwY2qx/g8jL90so+THkWBYW7PBnpLpYMw4Q6f48dqMtQHsT3qb
	3pHcF/eLdr4DxY6oJv36FIYA/5LuEMoOSxWLzEknaxI8ggKEPNakpYJtM+Va39262vXHuC9XfWQ
	3YkqYUiyKsMa8KChWFgkKuBdD90BbWbQB5
X-Google-Smtp-Source: AGHT+IFktJaRVQL3O0Bp6utEO8UMc0VZicEcSyobSFeL3Ri7u0e4wIa7Sl6wlc7e4nLZc48ufle+q9gKEzK7mexYjhQ=
X-Received: by 2002:a05:6512:ba3:b0:553:2868:6355 with SMTP id
 2adb3069b0e04-55356bf1294mr2148839e87.18.1749128126139; Thu, 05 Jun 2025
 05:55:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523101437.59092-1-wojciech.slenska@gmail.com>
In-Reply-To: <20250523101437.59092-1-wojciech.slenska@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 14:55:14 +0200
X-Gm-Features: AX0GCFvnKpjs7qcRC4zueo0StcdisXIytgLKoGyc_FirjmAk_wruvxxdurKXjDY
Message-ID: <CACRpkdZ7CEJJkc96Z=nu+Ax8jUJSK_YcMntzEBmoXK1g9d7uYw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: pinctrl-qcm2290: Add missing pins
To: Wojciech Slenska <wojciech.slenska@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2025 at 12:15=E2=80=AFPM Wojciech Slenska
<wojciech.slenska@gmail.com> wrote:

> Added the missing pins to the qcm2290_pins table.
>
> Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com>

Patch applied for fixes!

Yours,
Linus Walleij

