Return-Path: <linux-gpio+bounces-11055-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0F5994FEA
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 15:31:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 935332877A6
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 13:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACC591DF96B;
	Tue,  8 Oct 2024 13:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wUEdcGkB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BF31DED7D
	for <linux-gpio@vger.kernel.org>; Tue,  8 Oct 2024 13:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728394189; cv=none; b=s21c9NpMfxm1GHQPz0BOi9eGRj9LkhhgQLtmyWgR1CFL8EVWb8wMTOLgv9HjOc7jbGymfp+YCo6LsW4poIrDBJba8nPf6dP1RnhH8I6u1qf3TD1j78ZqJV0A4+WRODBfEIAd4hzzePXlsNlPKt4Tk3lKYMM9T2SS/WT3c4iyh5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728394189; c=relaxed/simple;
	bh=BnWSFbZeBVe/6ounKJVaPQ75xSHcEUdTf6VV0fum4TM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fer31bdESZPqyeJhvIxY7rp5DbiaftrR+zJLEEfwr7qs5peFLJBuiGb3oEufMEuMp3IJP5Vm8VoMQd3/UKamnu/Bc5+3dLarmtmRPFhUnENgvwbosa8kNTpfZK82FIc7TDbBuuGMlbaHq7G8okDL9irRQz/m8EUT6z8/Y1nvJW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wUEdcGkB; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fad0f66d49so84739851fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Oct 2024 06:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728394186; x=1728998986; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41D/07c9z8SjT5m7sW+Q9O4W5tJyGA9lVKCacmm0EAI=;
        b=wUEdcGkBum9Ssr73M1Ikn2CsoYa26uEYpFhUavoAEP7+XexM3rzUErufNoYkqNi/nj
         gDOiBmnmhK7AGr0HGpJsg+OdOORVmOisvYqWbW+MhdxhW7Yx3xP7miKjKvOrXpNGUynB
         +EUef8FnE7HQvMnlzRvk42X80xHRIkrVT7xE74hJIdxB5/toEaViZ73SnfxErUkfYHRW
         d1Gy2CbNWY0/GLhlF8uAy5uVqGlORPVGeRJQw3kgrqhtAYqKiNPSAnU8yiHJgc0WJnuZ
         VSwJmc/+5wQdHJGAV5eQBNGLfFg/BElyTMdZZ6zSr/TH7aZFK6wFCTzLTyrIySHgU9Q0
         lZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728394186; x=1728998986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=41D/07c9z8SjT5m7sW+Q9O4W5tJyGA9lVKCacmm0EAI=;
        b=AZR1PgTNxiG1fUPYFzlMSN4FcNpfed0cHzeO7gQ8cl7TjghzaFrlHqe6IiVw5g9Ip2
         OUl97406O2RU4lB6FwQ2jneJlA5BAE+RfnXsK6T7Wg0L80xdZXtVUyaCpDmgREp++Ehl
         IeFfP3sKLszus3BF2PMeXQ2PzsRSziBomQC4IFc5+PsZREM38D9G6PTKszVHk9iNvc2X
         xH1zFhtmrrH3HJMDQC330yn5WCejlsqyDx4Tu+S9OexbwMXRh9kpnyJpqAOF66vbt7td
         MCtrCcBUwvGoyUP22oQVGp+DydlAhKl9Y1emEgbadfO0i2hvSHE9Ztlo7zKVL13yjL3C
         IyTg==
X-Gm-Message-State: AOJu0YxcwUT5Foa5oYS2yeBzvHOdF41dWIJbGkabu34EUSyAbVjREZAk
	2Fwwrtl73YvmOigIR1HHwir9u+73QaiKs3ENS2liPAVKZsjkVW4iXHbzs4P+x61jfkE1lNahFdq
	kjjjpOevzW7WIkB7MoHdhDF3sgmdgF2sPJvOleg==
X-Google-Smtp-Source: AGHT+IHT+412MCRk5AMWFChSOM5VvzHdJdXEG8RpX8OyCILBmg4EY13F0ZQOWsI9hQopnoJw7WRF/FK9mW/YSHmW0o4=
X-Received: by 2002:a05:6512:12d1:b0:539:94df:38e9 with SMTP id
 2adb3069b0e04-539ab88af26mr7209940e87.31.1728394185933; Tue, 08 Oct 2024
 06:29:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240927-vfazio-mypy-v1-0-91a7c2e20884@xes-inc.com> <20240927-vfazio-mypy-v1-16-91a7c2e20884@xes-inc.com>
In-Reply-To: <20240927-vfazio-mypy-v1-16-91a7c2e20884@xes-inc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Oct 2024 15:29:34 +0200
Message-ID: <CAMRc=Mejgdd7M5UpR2Zbdu0HmhJRteJnqkSgs6KswvnmW-oAjg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 16/22] bindings: python: tests: make EventType
 private to prevent export
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, vfazio@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 8:57=E2=80=AFPM Vincent Fazio <vfazio@xes-inc.com> =
wrote:
>
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> ---
>  bindings/python/tests/tests_edge_event.py | 14 +++++++-------
>  bindings/python/tests/tests_info_event.py | 10 +++++-----
>  2 files changed, 12 insertions(+), 12 deletions(-)
>

Makes sense! LGTM

Bart

