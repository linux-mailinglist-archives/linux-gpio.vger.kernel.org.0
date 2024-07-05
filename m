Return-Path: <linux-gpio+bounces-8059-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C6E9282C4
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jul 2024 09:35:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DDA42893E6
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jul 2024 07:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95EE413BAE4;
	Fri,  5 Jul 2024 07:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cUp5w5w3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6215E1F61C
	for <linux-gpio@vger.kernel.org>; Fri,  5 Jul 2024 07:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720164907; cv=none; b=jlnvUzYRDEHJqa3yFOEn+t9mBIwQurqo7e/fiT+NV49B2sfLwKBpAQ8Kh81AQ2IO/4weasRj9UfBJRGQxWXz1rnvpg21iztmedwO9cllRYy3S4+LqUpKwOMYsiIr5RGcQj4EnmF7Czc9RDeBHD8MyHRcIF6YWgL3Cb1G6W1h6CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720164907; c=relaxed/simple;
	bh=Wrk92or+O+A80qs6NjXd3fn2VQaq5O/hCvP18AjsoBw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rw/4W/4+2YIEsQkSg3jrejgKZW07G73eBrI6+cli82LdP4D/MTJtD1/obdKPS8CX3h7wfydnDbjHg/jUpM+lZddCM1zfzD7D6VW22kcWSInR3ncAZXBd0YfwfBErNkTasedbNMRob1a51d7SmROnF2aU12yGg9se7IQPdO80HCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cUp5w5w3; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ee7a1ad286so14476311fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 05 Jul 2024 00:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720164903; x=1720769703; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OVxEhWZFC9uqfiiNqY5+iT6YbrsToC8wp1kf0BxdkEk=;
        b=cUp5w5w342MRYLoq8s1NB7ZKGxZ+vzGIL9/+QVwdq5tAX9KT8mywzH1pLt1tgdITCV
         5yJW7+S+m96u12/Q91ySHEoIC7FC25mm9xaA+SkjSdXfpmT/c6LQEAgV08Jj82ETb8mo
         rtumB87Y4wvZevGtOxpAUqXCBxlqTTG5BNbUJbFNt1F9aI4sZMrd7GJdcDsPew9MKnOu
         Mwq2ShM9vX/JQHbHiqxKjl8IbuNTTUJkiBx+cI+WyGPCo3ytsvwRWC/0M1yVbCMBZwWI
         fAtJj3y4ZaUqIIP6P1Q2SK5uq1+eYQY65xfFdsHWCTSiZpWyzALUCArtD50iiZ8XYY6l
         uPNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720164903; x=1720769703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OVxEhWZFC9uqfiiNqY5+iT6YbrsToC8wp1kf0BxdkEk=;
        b=F5XFkc3NkNAG2DsDKp4fg/R8wPNe961obR8l3sTBXSFIPl/yiUB8zrics/5m5rxvlo
         lDemCtxUJLT9ejPEsad3ZdGlH6ULUMlXEPluO5MkcJhQIG/uNjVlHI6GWzLs9iNRKKov
         tRIimbDrkqtW/2hdJhjSvn7/pd7NCVl2U7W+t7PsdAJcnEp61VoqcciryoGGoYgPNUGA
         CuOnBn4sScet9icS42tu/8y/VE1/skj05KIpwc2Ot4hQ2UC3y+0NyIzPDi8LSy1xmeOw
         xb9IbEr0Pqq/G3N0MWfLPVQuA8xpUKyca4j2YMvjS49qfziO4MduF/0ARDHIGq9E41OM
         MA8g==
X-Gm-Message-State: AOJu0YxOHt402KqA3PQs5TjrIl0ERecscJ8RqWMI8OZyDBVGUfz8wd/T
	8G6QpSlaRDB2VsajQh17As0OmmuOlFHAGb83UOl4/fw6xEsNR4EyvgtYZzCIMwqpGRvQoAxtcdu
	OwNaWNgaBL33jrC+ssWNKWjoLLyZlkzAt4FIaxSOMBh4JGQUB
X-Google-Smtp-Source: AGHT+IHUeIAJ+/KJBfFMTBM2DWT8+4IBIYyW6VjLMPu91DaX+bXrP5YKF8HfjH8K+c8FO9Rq0VBzTcluhNL4P2OR788=
X-Received: by 2002:a2e:9006:0:b0:2e9:768a:12b0 with SMTP id
 38308e7fff4ca-2ee8ee13b14mr25500011fa.50.1720164903364; Fri, 05 Jul 2024
 00:35:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240626053808.179457-1-warthog618@gmail.com>
In-Reply-To: <20240626053808.179457-1-warthog618@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 5 Jul 2024 09:34:52 +0200
Message-ID: <CAMRc=Mdb5_F3oQ1JU5imCSyNfxPrkTciKw9MGuBafTbexHLeLg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 0/3] bindings: python: more flexible reconfigure_lines()
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 7:38=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> This series addresses issue #54[1], making reconfigure_lines() less
> restrictive in the configurations it will accept, allowing for
> misordered configurations and reconfiguring a subset of lines.
>
> Patch 1 adds a set of tests for the new behaviour.  These all fail with
> the existing bindings, but pass after patch 2 is applied.
>
> Patch 2 is the change to reconfigure_lines() itself.
>
> The reconfiguration of a subset of lines works better with a change to th=
e
> kernel to ignore reconfiguration of lines without a direction set,
> i.e. a default LineSettings.
> With existing kernels, if a line has been requested with flags set to
> non-default values those flags will be reset to default values, though
> that may not become evident electrically until subsequent operations are
> performed on the line.
>
> Patch 3 extends the tests to demonstrate that kernel issue.  A kernel
> patch addressing that issue has been submitted[2], and the test passes
> with that patch applied.
>
> Cheers,
> Kent.
>
> [1] https://github.com/brgl/libgpiod/issues/54
> [2] https://lore.kernel.org/linux-gpio/20240626052925.174272-3-warthog618=
@gmail.com
>
> Kent Gibson (3):
>   bindings: python: tests: extend reconfiguration tests
>   bindings: python: more flexible reconfigure_lines()
>   bindings: python: tests: add coverage of kernel reconfigure as-is
>     behaviour
>
>  bindings/python/gpiod/line_request.py       | 17 +++---
>  bindings/python/tests/tests_line_request.py | 64 ++++++++++++++++++++-
>  2 files changed, 72 insertions(+), 9 deletions(-)
>
> --
> 2.39.2
>

FYI I did not forget about this series - I'm just waiting for the next
stable kernel release so that changes required for the new test cases
to pass become available.

Bart

