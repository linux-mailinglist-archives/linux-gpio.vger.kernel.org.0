Return-Path: <linux-gpio+bounces-25621-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F4CB44689
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 21:37:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4C46585674
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 19:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD8DA2749D9;
	Thu,  4 Sep 2025 19:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JYcAXvCa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC56E25E469
	for <linux-gpio@vger.kernel.org>; Thu,  4 Sep 2025 19:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757014652; cv=none; b=WO4eU0lnEUzhhRooEb5LjNffE2xMe7LfI5GW3surOzlt1aMOf0y1SzY6uCP7gQviBLvWEJRQGi65cRpuqToqw3ijrvFC/zdyPHVZ1gjCpCQQdjDbdGwg2wssuQMeZheswG13jQ9wZnFq5FvTMVx5HK53QvZUpX3y3td4TiQ2U+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757014652; c=relaxed/simple;
	bh=b71mBa4+CgOQozq8su9h0GwymINkcoGVGaHXRDgYI7w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Aq7tY9E72NcAYbQBT8rxwlrEs3yNGvWaThToVZYdwZFd1ZH7bf781pWTUa/6ChTtp/5nVu/TisgDgX0SmibT2dU7F0awkIxOXi7EPbjuVUfwykFyg45W4DZRYcqwjJRQ3eqYNpDjz6KczWYZOCk94xjYl7jzhlX0wD4ROINo+7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JYcAXvCa; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-336a85b8fc5so10959611fa.3
        for <linux-gpio@vger.kernel.org>; Thu, 04 Sep 2025 12:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757014649; x=1757619449; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1AJ6DtMOF3y4OJW8/5WYqkSHHcxXo8CUAVBKpGx+P1k=;
        b=JYcAXvCa3oYT9bKK9TdTArz+3Hk84wC/WowFikdApkO0gl8lVjYMVnYmw1t1x8dIIf
         gVexotT3ogWMSxUVOoUbnSxAV6Enr3hhIREsp29oKmHgzH1bIeKhqGut7LSHqaS3YT4r
         /FHP3o49+pNJMhnpHgU7Ug9rgJql+ysTBedoQiusUSfWFYwBVdgp3jPe8T0jNhRp0ZgD
         vPieqEw0ajZv8eUhvi/VYSUi3/OQY2GI2lMuv8u+OiyTz3rRhE5nefW+Y72Y3pht3XsD
         5LRW6vzIsxNnsgzbi3KC/Y2bg/XDPatLL9jYdNw43MnqQ95JF8KkLZ7RiN5j6WVZn3Ry
         jXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757014649; x=1757619449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1AJ6DtMOF3y4OJW8/5WYqkSHHcxXo8CUAVBKpGx+P1k=;
        b=AJriYyhdJvrPCXSHJIUZckAfe3dtlVG4+1qA2LtzmOEn1z/cBEV4aWGX4cFM+1y16g
         /1BHs9exVCTpz1uf3neWIfSoXdxeV1ru1WUK19GvqxuZyVSV45hUYkzAfepyf0a5Jy1p
         QPd79HQCiICUd7XxOSZlPGCKXKbcSxWRmSNxLXa9CJDkCi2FrU8LkEdAgArgUkS4CTZs
         m6dGpTm1OrHaxSBOhz8gO6mklW2gPNTFxxuM8XsInEWblyNQRjedmM5uKM71fgHomhKp
         oK5wfExFhYFZ5cvnaopPG3nvJqWy/A0BLb60ny2uVOhn5VDlw11fq2PBgmLIpyTZYOPE
         79uA==
X-Forwarded-Encrypted: i=1; AJvYcCWekviz0GZE4/kWsOV/2pus5r6Xd78eUwg2aNjJXwMABrNKrZPj0AzeC0h3mlH40Nd5nSK2A+FTKCX6@vger.kernel.org
X-Gm-Message-State: AOJu0Ywza7oDMinANQaJBLMok4ZSteeplhezi/6Mkgc0OhuxbjL0MnVp
	DmCPGFQ9VsNUnawBzec0GI0No3JWZV2UvKZz368BBWO8QOzvcYqx2ZsTDoIYSTYa1xpwOOU7atj
	DcZCDJYvQqpIMjkLRs4m08nQwBOFUYpDNDMlkRhJ4iQ==
X-Gm-Gg: ASbGnctStIMsBO0VmtL7rFQjq7X9NLThECns0I2yPMZGTfUWNgRAaXwX0m1tvSYbY1x
	R0m1bhqCHJi+uGch/M2mOxy5aVZRA/I+08hYh0Zxhibsw53j+6f+OI2kr0ZVGBzMQQV2O8vtAgE
	e0KJaE3iopro23TvNlOqfhca/DxPUnOoc73YOqsF77WLNek53xHU5yFNIh6r/zI5uB4xJhO3jdw
	VMNPAvcKiEbK0hUWA==
X-Google-Smtp-Source: AGHT+IHcxZXWcQcGpLSD+vSozPC/BlwJwc3PxIluTYmSvDgzHTW8BmhbS+tPWNA+mMMfD1/Pl6uPG6IqMUkocmLUfrY=
X-Received: by 2002:a05:651c:1501:b0:337:e3e0:39fc with SMTP id
 38308e7fff4ca-337e3e04b6bmr41778151fa.21.1757014648753; Thu, 04 Sep 2025
 12:37:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aLnhbpfeweBI1H4N@stanley.mountain>
In-Reply-To: <aLnhbpfeweBI1H4N@stanley.mountain>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Sep 2025 21:37:17 +0200
X-Gm-Features: Ac12FXwwpWbvmfNMOzJViHg9lMWnmNonsNEwaek3gjtIoQRyh6dIvrGKZ4b12vc
Message-ID: <CACRpkdb4RjOSFwmao_LD0GM_+BSc5Ei2RmcXFPV_fBGRhB0DgA@mail.gmail.com>
Subject: Re: [PATCH next] pinctrl: keembay: fix double free in keembay_build_functions()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 4, 2025 at 8:58=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:

> This kfree() was accidentally left over when we converted to devm_
> and it would lead to a double free.  Delete it.
>
> Fixes: 995bc9f4826e ("pinctrl: keembay: release allocated memory in detac=
h path")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Patch applied!

Yours,
Linus Walleij

