Return-Path: <linux-gpio+bounces-13162-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A84749D3CF4
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2024 15:00:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7000A28387D
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2024 14:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3A191BBBC1;
	Wed, 20 Nov 2024 13:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ciNW9rXF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9231B1AB6C1
	for <linux-gpio@vger.kernel.org>; Wed, 20 Nov 2024 13:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732111175; cv=none; b=KCgDPQcATvYIYbp5MOLi9mTTzcfoPIbfDY2w05ozzHVGIdFfeRrNtz75tshd0GDCRtSKoDewfcPB1NN4cRBAQTkt2X7UjMiHgvyUUzM3+URO41TqX0DE63mVtgb2V88MGeWH/zWUgkPtxmuDm5aNQqITR/zre5XrV4R4uW+3ddY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732111175; c=relaxed/simple;
	bh=r0bsBRHdUVhsstLHLmGZCtCYJbm8LUhKw5wUTiU+7/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IAdsty/TIObZv0WzHYesmZQILjmGDvGafEzDFDD2fj9u4jIQ94E5EvT7q4P4PnNWdWIN6Hst60XCxWqA7C1qXZgbDdr1XMDzDVfOkUwF38JLG+GRe6xfGLcsliZSb5PVFbjWwNgkXxV7Vh34NuO1LDIfGXIeQHwOMKDDVtcQKY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ciNW9rXF; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ff589728e4so10168281fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 20 Nov 2024 05:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1732111172; x=1732715972; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r0bsBRHdUVhsstLHLmGZCtCYJbm8LUhKw5wUTiU+7/Q=;
        b=ciNW9rXFcyWZ5hfshSoPpbi0R2EfmR+YEbVXNEfDR7GFCS7svgT/420xAub+0jynac
         9yV64iFtIAFPqM7+5E1Q4HznzvegS+X+t47d7nFbdUYAL9m1VYwzcZktkX7N/IEPD76/
         kJ9Xlp9/0mI5kFWdQixI0xI3nsVIoIhMZ3UH9LQJRMbdINaaJj+Q//wc1Uw4Sme1fQlE
         8I7HA/mk5tNhXDgIkUsxWxLznTc/EtvICZ06OwqYqjFN3YFusvAKF5zk3X9ih00A1hBg
         Rt9sGPBrZA9WqXFmqQizBw+qFtKuTB6qXygwYzMABCSOMczSORjXIkujYomW+AHmFTg3
         zLMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732111172; x=1732715972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r0bsBRHdUVhsstLHLmGZCtCYJbm8LUhKw5wUTiU+7/Q=;
        b=tLJIMQAxEo0cmrnRqju8lKHRacHN78wZd3MvdR7AEYbXItg1AWJxbxZkt8C9wm+rhi
         az6JjpHnqCpthWbGq/+3ovfMTiZqrEdG7ejY7b7z5x8rdEWMHr99LfO/jQKd4tZljEZ0
         JqHMCtcRfeAIk0qQaDQuTefpFUon4ekGs106+Hl4tBqE7MU8HqPIDXZWTsg6Zj65O84Q
         gWgTPMmqXYawM1DucoQOhSlATOKVuaK6QVTDH4oluK/Fz0tzAfkipcscXCu9DefFji9j
         TxbHqag6noL3/IKNfBQWhzVLNfXZVvgywmQFfSqYhRHCxzpSGlDfojLFQHm5hqYgxSv1
         7Plw==
X-Gm-Message-State: AOJu0YwP9V5n0SvbZdWcOwDE+j72aVv76AhzMDXi8C+YbhT081wMCiPn
	IdmYpCGosYZOszITkkuquQMUkjXr8nprl6KkcjlyIXvD+zmVw+IvAknBxj0p9/AZ41/AAvCWQxd
	q82ABIYCNveKpJcn5J39Q0VF08LWUB1ZaP2FXtqI6cfPQofJa
X-Google-Smtp-Source: AGHT+IEdUyGl94A4Q/rnD1BGxCBFWTIqBB51hfK7GHrOYzp+GP9Zel7qBuxhMsFXcrW8Yd6XVsO6eyhkMKwEtBqGVfM=
X-Received: by 2002:ac2:58d6:0:b0:53b:1fd1:df4e with SMTP id
 2adb3069b0e04-53dc0fbd349mr795993e87.19.1732111171499; Wed, 20 Nov 2024
 05:59:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241114145116.2123714-1-vfazio@xes-inc.com> <20241114145116.2123714-3-vfazio@xes-inc.com>
In-Reply-To: <20241114145116.2123714-3-vfazio@xes-inc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 20 Nov 2024 14:59:20 +0100
Message-ID: <CAMRc=MevfBeB99HH70a4eyD2P6a7V6x2ntADDeTO89cZr0P3Eg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v2 02/23] bindings: python: make internal a
 private submodule
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, vfazio@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2024 at 3:51=E2=80=AFPM Vincent Fazio <vfazio@xes-inc.com> =
wrote:
>
> The internal submodule shouldn't be exposed as part of the public
> interface, so mark it private following PEP 8 convention [0].
>
> [0]: https://peps.python.org/pep-0008/#public-and-internal-interfaces
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> ---

FYI this broke `make dist` because the Makefile still tries to package
internal.py (without the '_' prefix). I fixed it in tree.

Bart

