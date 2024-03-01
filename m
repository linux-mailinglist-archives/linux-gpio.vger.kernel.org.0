Return-Path: <linux-gpio+bounces-4019-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BF886DCE2
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Mar 2024 09:18:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3265E1C23FD6
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Mar 2024 08:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D099869D26;
	Fri,  1 Mar 2024 08:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pYcN9v2M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD6169D23
	for <linux-gpio@vger.kernel.org>; Fri,  1 Mar 2024 08:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709281094; cv=none; b=gXldoBtxVgc60YO2bK21BuYsrg6PbCN+TwiRMJB5OkeNX6PW4EzP61h1E3thwg31Jq00+s/Ql2dqSh0GhFZZBfMTgckktUfO5gRnYfRd84V9bA9w5Sbckau3YmhiKmCYeK92/Ug4flZ88oKWkxgMC5XRnZQx6oVvg89mDghBheo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709281094; c=relaxed/simple;
	bh=yp68DEdZUIp6DbHm5jT7o9JF91i5ZA3+8zf7cCaGH40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qCJc/vctkyt55IjW0rLNoOyH6+ndkRSCU13avneR9FGocMKV20fetmQ6EfI/GrXGMefWlBeuVbNHM7PU/T+8tgtdiisstSHtkeyV2jkqLDML2X9/ExemSODuVNcHtbl0YBO/YeGE/DOhguxQdw1ri/ah8yz0BhvSl5l36WpkJB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pYcN9v2M; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-4d33a041ebbso479553e0c.2
        for <linux-gpio@vger.kernel.org>; Fri, 01 Mar 2024 00:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1709281092; x=1709885892; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yp68DEdZUIp6DbHm5jT7o9JF91i5ZA3+8zf7cCaGH40=;
        b=pYcN9v2MFnr+htNsmgg76MVJkUTQPC8qdovJrex9a8fus63Lm4KwlesmZH+WqfGoJZ
         E9c4HbZqv7hE9TtpuaiTVQkjLee5P3eH9bI+W364kdjl+144FclYhvtex6NGt7XDxIja
         qA0LcRsjeuElviSQt2y/1/4WSbjnbLKbPTAXjh0lJr8SFtqEAaxD6O8WAMDQUgFs1nGO
         N0BUEU97MlrfPW9aI6CIeBeaub3YyGQfXyVWxRORDi/hpeqlTVrF0i8Fh5QaOfqgXZj5
         TW7AKGtdo6nAoEgxL4lSz5b2VxV0i/qMygbk+WTuFMzOHFRTdJTfYaq6E2Gpn3YpHdA0
         yeQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709281092; x=1709885892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yp68DEdZUIp6DbHm5jT7o9JF91i5ZA3+8zf7cCaGH40=;
        b=FSGWyYMcbzPX0Hg4J+MllxV0790xVJdt+dF8beBqQYWUN1HtCwLT+T+fZ2V++pl897
         Wqu6QsfPwZ+tJIRFfxohhPXK6OvwQ/ETK6SHIm/Alh5SVXmDlx0chJOnu5NNWBIsghqT
         0c1XdD/+Zmbua/JmnexlIm1Qr5bVmuXSwHfbbwQQFA+B68GKAlzY/5KDIlInkYacLWeR
         SuhMNA8lqZTx6sxdBtFrvWiYnPoMdK6FRr88CkNI716ctBVOlJlyTmgN0jmWVCXHAqhg
         KDHtYuVAW0GhtIhvhuGFhHPxpOyNtJlQjvV03AqwmhUN9p1JJ8XSkYzIDHXycZD2zr6o
         pz6g==
X-Forwarded-Encrypted: i=1; AJvYcCXfXWeUFJEA7YtqTkxarrYe80j6hHVIpUfg6rWfmAlVvuoRVDmdfYWNtCVJ3bmlgHIIjYb26YIq2dUHWy24sGXJQ6DIuSqxSJ90tw==
X-Gm-Message-State: AOJu0YyID9SoGRHO8lIbJL1ZslasrnBo9CAkW8QY5vEbGi4bGesHdT4D
	0My52U8X2tMBptOmRr/Kf6BqKHbvd0MZ8TwArn+5HBpgq8kIZiwfq2tSzHCcKU7yMH0wqjsIRHC
	TkVZxgYjeD+dq4Bnred5xbLy+DtZoCX6yxxFDAg==
X-Google-Smtp-Source: AGHT+IEhwqISmIJ5HCe1Nfu0Bnq1Pv29jU9DH3Pp2yv9SKTj1rghbwGyjrDqQbRbf0cdwpde2nH0FRgUZpSk6SGKDXU=
X-Received: by 2002:a05:6122:1aad:b0:4cd:b55a:bb0d with SMTP id
 dz13-20020a0561221aad00b004cdb55abb0dmr704388vkb.2.1709281092151; Fri, 01 Mar
 2024 00:18:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228003043.1167394-1-andrew@codeconstruct.com.au>
 <c2060450-4b76-4740-afe4-d14717245f01@linaro.org> <16ddd99007176da3f84462de217cb76c8fa4e1bd.camel@codeconstruct.com.au>
 <CAMRc=MeEyo7y-G1saydxtTRedNtHPaEeLANuzXt6KsiDU2jOWw@mail.gmail.com> <e55aa1321ccac8e6391ab65a5a439b49d265bfce.camel@codeconstruct.com.au>
In-Reply-To: <e55aa1321ccac8e6391ab65a5a439b49d265bfce.camel@codeconstruct.com.au>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 1 Mar 2024 09:18:01 +0100
Message-ID: <CAMRc=Mfa1uUhkPNpLdcMsGC4=G+_MGzaxXRL7UVdfKJD_zF0+w@mail.gmail.com>
Subject: Re: [PATCH v6] dt-bindings: gpio: aspeed,ast2400-gpio: Convert to DT schema
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linus.walleij@linaro.org, 
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 1, 2024 at 12:23=E2=80=AFAM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> On Thu, 2024-02-29 at 09:52 +0100, Bartosz Golaszewski wrote:
> > On Thu, Feb 29, 2024 at 4:21=E2=80=AFAM Andrew Jeffery
> > <andrew@codeconstruct.com.au> wrote:
> > >
> > > On Wed, 2024-02-28 at 08:47 +0100, Krzysztof Kozlowski wrote:
> > > >
> > > > You still have way too many examples. One is enough, two is still o=
kay.
> > > > We really do not want more of examples with minor differences.
> > >
> > > Noted, I'll keep them to a minimum in the future.
> > >
> >
> > As in: I'll still send a v7? I can trim the examples when applying,
> > just tell me which ones to drop.
>
> Ah, thanks. I wasn't planning to send a v7 given the R-b tag from
> Krzysztof for v6. I intended for "in the future" to mean for patches
> converting other bindings to DT schema. But if you're keen to trim some
> examples out I'd drop the aspeed,ast2400-gpio and aspeed,ast2500-gpio
> nodes, keeping just the aspeed,ast2600-gpio example.
>
> Andrew

It's ok, I applied it as is.

Bart

