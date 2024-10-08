Return-Path: <linux-gpio+bounces-11051-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 082A1994F6F
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 15:27:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 336971C22444
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 13:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0CBD1DF997;
	Tue,  8 Oct 2024 13:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JhOEObwp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0124D1DF982
	for <linux-gpio@vger.kernel.org>; Tue,  8 Oct 2024 13:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728393905; cv=none; b=ExGeNmMOKE6s7mv4Xo9R69Q5KVX8prmxjPhQ1FrpNC7SXQpV3GY6wV8FWn/6Wo6Ua1ug/aNfx/R0mXrcviwHMnMWvt6MGhaSKCowFOCVDqAj7IrwlMlOskQRtg84hIFChJa++mkWwINPKIaYtfQ1pw+1Squ1e3xrWHFtIt4XTcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728393905; c=relaxed/simple;
	bh=EbutHK76f8Pg2wi0i9BzchSEHt8YtvXsCBDLHqZS+bc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MEOiavYkJhsbcDvt1an8XiUANlz6AGnL65plvh+WCha6hHE9ZADEtXvasKINoValWPieHE3LTVxGfQ6+51hMn7di8PrX5HMKPZcBNnthjUJxtUREJ7U+svmCoUlS7Jnus2vylIvbmdHo8W2YYIRc24nsD+MjizPQV8mbH52/eUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JhOEObwp; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539885dd4bcso7007600e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Oct 2024 06:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728393902; x=1728998702; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NdNxoIsbYjXhYpjVqXv88pqVAhsxLXS4MNSEZntvRFw=;
        b=JhOEObwpNewIEZM1s3yzUOwrqkuVai/lJ7WkdRESWpx7tTk0H6AUKkhdEgWft38cbm
         kvkCHx3Kc/NXG3yzrkkp8J3bkOU6WIZL+zmm5ot1/eCoRnJUiK7ULmu0f25gr4KQcCCy
         e2bJhCaXEPsoNeHm8ctP4lGpLs/1F5Ha4KBtvVawS7PMHPpCdjoAZhUWKkF/jDlq/N4D
         zDXypLLzAVUe6YXfXWKpOeT5+jJpbtQyT2KHGowvPkksXV8tXUGwB5DVqbX6KJExTXeV
         hkEuidAtz8NeFnPXM43u9PafsOHQTh3zBhyg4YAmhI+Dl1Btx2oA6Rt+evj+vwFYyzYR
         rHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728393902; x=1728998702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NdNxoIsbYjXhYpjVqXv88pqVAhsxLXS4MNSEZntvRFw=;
        b=AOC16jqY0P2YJYlOiKN6N1MbZV9u9xRnMp6hO7VwAzwAMOD7XHr2uq7BgbHrgCQz21
         wCqkvrHpzs7Htd9yOmNurG9CJz3gnc/RH4TkgZiXclKU55Nf8h91OCIq3EhaQmHOR5pe
         0cAG2MF5XjQzIlcc12UKbXyc8KeqcTGYdPnUWlv04G/rXrMfieR/gnMHNklR/utrrcp3
         t+WL/HvTYdHgXYfIld3FDWjTyY3kw44QIg/SUizRCg0Zxd3akfdbs/xgN835tdhI+G0O
         BjmZmG/luhWtVU37AOnVkUnH0GMWm3QG9FoDn5Hl9Kk7aU45mXYT7LqyhubMR9gsuhzd
         wAuQ==
X-Gm-Message-State: AOJu0YxuaPg/2Dx6+qyDCuNIoiBTDaiGqllrU7hA9X+UwjLQFGP/GVSK
	Fwthkql0RVhLL5+KQfuTPXxEanL81oLFrFywUhwXT+ETAq6TZXFx8HG2TvF/BLZBQA9kTdNo08l
	Lq59Hle/B7JZ7FaAQlBpEZPY3Ro6V1g77AoYhgQ==
X-Google-Smtp-Source: AGHT+IHg9JCN/fvvqPeSDuKxX3MJAdF9yM37kCxQzPx8Veo0iQuCHz9E7Inh4e4vRXIi1/Bc3kBeJZUd9Lr/T549oqY=
X-Received: by 2002:a05:6512:3b2a:b0:52c:d905:9645 with SMTP id
 2adb3069b0e04-539ab876e2amr8474047e87.13.1728393901788; Tue, 08 Oct 2024
 06:25:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240927-vfazio-mypy-v1-0-91a7c2e20884@xes-inc.com> <20240927-vfazio-mypy-v1-13-91a7c2e20884@xes-inc.com>
In-Reply-To: <20240927-vfazio-mypy-v1-13-91a7c2e20884@xes-inc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Oct 2024 15:24:50 +0200
Message-ID: <CAMRc=Mc=1PQiZ6aP6pZTicH5jybs3JOMKBgR7mQO_Ofe4=ZVWg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 13/22] bindings: python: selectively use f-strings
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, vfazio@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 8:57=E2=80=AFPM Vincent Fazio <vfazio@xes-inc.com> =
wrote:
>
> Dataclasses are not migrated to f-strings so readability isn't impacted.

Could you add some details on what f-strings are and why they're preferred?

>
>      def __str__(self) -> str:
> -        return '<LineInfo offset=3D{} name=3D"{}" used=3D{} consumer=3D"=
{}" direction=3D{} active_low=3D{} bias=3D{} drive=3D{} edge_detection=3D{}=
 event_clock=3D{} debounced=3D{} debounce_period=3D{}>'.format(
> +        return '<LineInfo offset=3D{} name=3D"{}" used=3D{} consumer=3D"=
{}" direction=3D{} active_low=3D{} bias=3D{} drive=3D{} edge_detection=3D{}=
 event_clock=3D{} debounced=3D{} debounce_period=3D{}>'.format(  # noqa: UP=
032

I guess the comment tells the analyzers to ignore this? Maybe mention
that too in the commit message?

Bart

