Return-Path: <linux-gpio+bounces-2556-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AE683BC33
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jan 2024 09:43:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98F3E1F28A80
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jan 2024 08:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB2E21B964;
	Thu, 25 Jan 2024 08:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jHovY/vh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1D31B948
	for <linux-gpio@vger.kernel.org>; Thu, 25 Jan 2024 08:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706172213; cv=none; b=Ey+Sfu+EzAU6JXUlbpRv24LY9YMQUbzcpkkVjpP7gsvYiZWtbObsnbZkC9v0yKslwoZyesJAOOE3MAIL39iReigFaqNUtoUZmaRHeKyDedR5QwscGxYmvWahwp+cBSlF7CshD0DjGhKKOfhGaVUBE2Ucs7SOAhb8AQCAg8B75yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706172213; c=relaxed/simple;
	bh=R6xBsFIzxs3ZX3VwdwbYtSZ2G1w2NKp7zYhPX2+phdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LhypIFhRdmw2dXNcbPMQwTAgBqKOhzPmadHKtNWZyS316y7ZM6Myy+phQyForLMpZd1fbGG/VPJLcgH1a0Des+wLeDaK9PDlFvqrKx0lAedv3ATamDwbo4Mv/Fe0hDXCEeY1YuSNciGYewxgsUYgTRc0KCss619ba5sDVdDFkas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jHovY/vh; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-7d2e1832d4dso1479062241.2
        for <linux-gpio@vger.kernel.org>; Thu, 25 Jan 2024 00:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706172211; x=1706777011; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R6xBsFIzxs3ZX3VwdwbYtSZ2G1w2NKp7zYhPX2+phdM=;
        b=jHovY/vh27gGi83bwSC1nxezO1U38Th7Yr+oeesczc0u1vRIrqI56PvBSDDOQJapq1
         KJKQcS0JofaOnpRCVUwGoGZY1038ln9dpjyyGi5BOczjhnWE5/i0diSAyGIOtf0u4Sew
         aPT6WgX64VFgu/BRzSseqDJ9BXBIwQJs5z9hJqAb2eFXJdkmN97e5h6eQfoGp/85LZw5
         7qsa3AF0wujZqQgk5DHUnX0oXWfins7l/7Q+s4Ol8+mnfeXCXzfB+gobdYuEcOxjsaiI
         VA9mfO+3nqvY7KIWiAhsnD0Nz5IgZYLmR93oNqTfagEEyJpCwPdmx/9qYWl0ecAGYjoi
         UaVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706172211; x=1706777011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R6xBsFIzxs3ZX3VwdwbYtSZ2G1w2NKp7zYhPX2+phdM=;
        b=iwoefpezztZM2M3rqbKUrSEofMhRIMuqMMxC0ObIojinUvlpmUer63tbp/CSVQJWxK
         nHq3bY04forkyFayz0yeNve2qb69OUjWmECTnoQuiss0hgGXU0WCt1X9afBbEvSa6Otp
         pShge8OENwh3+CiXIILcdwpaOo5UW57EK3zZMuiB8XpHudoG3ixi/GVMl/x3yDl1VUxS
         pl2P8jMEH3RP4T/u22q7gl6efhodoUHNbRqGHSUVjdOSQuyE+XEJpUOfj0klve9jBsKS
         qaEv7qIkV/eJGWfwCTX1gvQVPuOES2jcghxNl+heW3d0b/qxSBKDeSbzSc58tnGS5onY
         emow==
X-Gm-Message-State: AOJu0YxTdiUQR1QY1YeQhXZGUkO5BjuIqx0hlCsF39pSvDkX9N86grBm
	JdXNAEkWW05LwaLUqBppDdWpXzQ71KaXlDN014+tJh61zz4fDVEwrOwTzNp7Q5yjrWZ7ZD8VMkC
	lJ3tv2p9CmxBJTVquFuEc2b9SmsIoFT8ZZqG/og==
X-Google-Smtp-Source: AGHT+IEbxXAzBMt9uknzb02Bu18zwPl1FJlUa5sv2Pkf2R84ZO0GUaj5kptWwmB77ttmAnfgr6+xWwyt6cR6zJEEknc=
X-Received: by 2002:a1f:ee4b:0:b0:4bd:7bf5:934c with SMTP id
 m72-20020a1fee4b000000b004bd7bf5934cmr177165vkh.4.1706172211020; Thu, 25 Jan
 2024 00:43:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240123133828.141222-1-warthog618@gmail.com>
In-Reply-To: <20240123133828.141222-1-warthog618@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 25 Jan 2024 09:43:20 +0100
Message-ID: <CAMRc=McEwWQuJMb+25Yo23yXbhTsCDN4kMT=K0Lwg8xyJTrHpw@mail.gmail.com>
Subject: Re: [PATCH] Documentation: gpio: describe uAPI behaviour when
 hardware doesn't support requested config
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org, linus.walleij@linaro.org, andy@kernel.org, 
	corbet@lwn.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 23, 2024 at 2:39=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> The existing uAPI documentation does not adequately describe how the kern=
el
> handles the case where the underlying hardware or driver does not support
> the requested configuration.
>
> Add a Configuration Support section describing that behaviour to both the
> v1 and v2 documentation, and better document the errors returned where th=
e
> requested configuration cannot be supported.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---

I applied it but shortened the commit title a bit.

Bart

