Return-Path: <linux-gpio+bounces-13104-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D02619D2758
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2024 14:53:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E6C41F23693
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2024 13:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E9091CF7BF;
	Tue, 19 Nov 2024 13:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qbdBl7bi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C474A1C1738
	for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2024 13:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732024302; cv=none; b=fAbSbeIZ9PvNxdEc6mzvO2zneJL6TBZ2DtlE1Bn5v/rr+NxOC43WIrPILLxtEkynIe6ijnPqHFsOTdbTWT7FnICCkUsqKukNKEgGT3Qdb2PtoKrBKfrg/fgXfzjMH1oAwZlB9cF2tKqXcOulQd6prpMs3bHfH3s8kESqoEx1PVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732024302; c=relaxed/simple;
	bh=s4mlHQKI1ku7A4iiu8DQMqf3hGoumXLlbasp2mnxgHo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kBkhG+/3KhNM02AhW19u08uXX5exBkQmuYk0nn485UZf4sEOP45wAO9FvlFoggSHFhiWKMnTJ1C1g4HSotH97/vSHVApsrwC8YiYQphOfHHTN2SxeKjnZKR1V9BNs8eK89pFgTc2NU+S5kK/KVF2VTT6lfYfo0bnfh1IMxwNS5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qbdBl7bi; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ff589728e4so58162611fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2024 05:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1732024299; x=1732629099; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s4mlHQKI1ku7A4iiu8DQMqf3hGoumXLlbasp2mnxgHo=;
        b=qbdBl7biDIknNZ8UdWmJUf10NXORPB9WViWsaVxcDJnNnjpboUXFH2eSzeiCi+nHZU
         3dZ8r1OBiZaTOYbUXg0LXRzAIPMRnGt98QSBmXOVDD94XCtAgZR3qcuvXP+Xs+HloL22
         kwrG77okcPRUxmBDGBONaS+Ga3Eus2H5ytyI4oHdFVTeqWXMnIn572bT2EPG4LrtUbHJ
         GB/aAfqxtLNb8yJN6utvNCsI4hhXeEKZm1iTVdnQw4fQ2W1qzl3fJ8k98l4IwTOCwJNc
         LTDGg75rq5Vh36B0ocf6+7a9/BZBf+QC/8lks96UQdBEO6Dath6irMBIHCoG9UkWdj78
         N90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732024299; x=1732629099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s4mlHQKI1ku7A4iiu8DQMqf3hGoumXLlbasp2mnxgHo=;
        b=BQREoFRTLallwKmeDQTc704fnRq2oMX+5hWGdKy395kOYMUmWoL+ERiUznms17qhqD
         3cD9WJTHMn544gUYn2d30gdE0V60ECOcl81PyGo54iwfy7FmX1DXzfra6ZGKMVqegjP8
         AySdTRgk013NuPCYEq5DkSHsfu88ngT594R2Mfn0QRfaKthyTqxq+pkk3uafNKi4i0b2
         I9vU1ReFaCf9NH64T/iddP7VC2y+rNpUr0mqQzmUnrZGj+vZiV9Mc5orVrxgrEwo/gtN
         rxiBebyvdVKGkZSghI6rb2eRKgRyWDjt4+GVfQKrIMrhC1xevKVLe1itjBqi+ZCHjHKF
         hc2A==
X-Gm-Message-State: AOJu0YwEDXz2FJaDf2gecWhSrD3iZ+dubQLD4pEcKErigR1omX8hSVXX
	TFJGDhkIjiEaimt9U7dfb+0UsrG7xTqV0ooIRXrLzt0rP99mseAufLHqS3ZArosdj62UyehDbqQ
	PdBqq6gtlDFXeOo7qdt51NHMtuOrjohYbWssDUYkWna1U27Pl
X-Google-Smtp-Source: AGHT+IGRY4x32/L3NxNfcgvS0Gcp1Vb/QtPuzlJWVL9bgdv6B1e3u/LprasSj/7xhFpIdgAxwaBKdY7mDFv5L1ulcEA=
X-Received: by 2002:a05:651c:210a:b0:2fa:ce0d:ec34 with SMTP id
 38308e7fff4ca-2ff83b79d43mr11465971fa.2.1732024298829; Tue, 19 Nov 2024
 05:51:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241114145116.2123714-1-vfazio@xes-inc.com>
In-Reply-To: <20241114145116.2123714-1-vfazio@xes-inc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 19 Nov 2024 14:51:27 +0100
Message-ID: <CAMRc=Me9qD-VRr-JSXfFkE2O4xUhoKBSo5ug-nyw0b4wkQ7WrQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v2 00/23] bindings: python: conform to mypy and
 ruff linter recommendations
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, vfazio@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2024 at 3:58=E2=80=AFPM Vincent Fazio <vfazio@xes-inc.com> =
wrote:
>
> This patch series employs mypy [0] and ruff [1] to ensure the gpiod
> library has correctly typed public interfaces, is performing proper type
> checking internally, is consistently formatted in a standard code style
> that targets Python 3.9 syntax, and passes a subset of linting checks.
>
> Patches 1 and 2 remove unused imports, sort and guard the remainder, and
> ensure the publicly usable classes are available from the gpiod module.
>
> Patches 3-5 fix and add type hints to callable interfaces.
>
> Patches 6-14 fix type and lint errors internal to the bindings.
>
> Patch 15 fixes a duplicate test name identified by the linter.
>
> Patch 16 and 17 remove unused imports, sort the remainder, and fix lint
> errors related to a shadowed export.
>
> Patches 18 and 19 fix and add type hints to callable interfaces within
> the tests.
>
> Patches 20-22 fix type and lint errors internal to the tests.
>
> Patch 23 adds mypy and ruff configuration to pyproject.toml and adds
> documentation to the readme so future patches can be evaluated against a
> standard set of rules.
>
> There should be no functional changes that impact existing code as part
> of this series.
>
> All unit tests continue to pass without changes and code coverage has
> not changed.
>
> After this series is applied, the public type annotations will reflect
> the argument expectations of the class methods so consumers can type
> check their code against the gpiod type annotations.
>

Thanks for your work, this really improves the bindings.

On a related note: we still have some uses of deprecated distutils in
the code. Do you know how we should replace LooseVersion to not use it
anymore?

Bart

