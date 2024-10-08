Return-Path: <linux-gpio+bounces-11056-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DF7995001
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 15:31:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D18EC2844E6
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 13:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C84C31DFE16;
	Tue,  8 Oct 2024 13:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IaEzK9b7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDC61DFE0C
	for <linux-gpio@vger.kernel.org>; Tue,  8 Oct 2024 13:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728394241; cv=none; b=U0bnEAbaYi6RUbrNJhTcMkOW8+dvdnMJWRYcSVK+Vef+dLh+4HkCvDT3JzJjmvnFLrlulQwySAdGwb2szliVOeQSmNB6QCGe0Bu6VUUT4w6Jtp1iNQYR+JJiN5+6ER0ZRe9AWUlweswWabeDf9GjRmYzZ70T0KQ6VFT4PhwPSUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728394241; c=relaxed/simple;
	bh=IpFdtWh67UbUT7Hn2WIMoEq/aLW63y6XJe4cH8ihU0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oNvFDgsRH8ua9HHnrZCtJu6Y+wfyGjhiWhgKJGiqaQzenROlr51oQ/z6ks53P88QaokeWT3BK+BDDVL8eZpirxnIai8XWH0IncNUUnw6p/hzsSHRlDbJ32rpo9c7LZh651RmG8PZfzDn8KVKbsTr5vetlP2IejY8bqad3Z+UKtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IaEzK9b7; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2faccccbca7so47465171fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 08 Oct 2024 06:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728394238; x=1728999038; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QACVQgD6547uPXKrZtM7F8hI6p1rVYBVTpTgVKbT+VM=;
        b=IaEzK9b7dhSptli4FYQv/adZ5z/Mhk5t73WzwczyCNhqDvJvlKs9yeZ4D/6s7YWZPS
         nn2tk9qEGoSZyS6MKoIPQt7y+rwLtIvhBpAjS+eTH9O1hti3Y9rQUdEmgNsXUJItWRcc
         XGcCC8/0yz+JYHaHEY/jpB5cdUrIWCSVXzGN9haxUxAz1npT9gUm4cWkqHOkWT2d6lx6
         6qlml0ZVit6I2sm4rioa+L57cygdsBNmb6i4nRvgVg66ftx8xF4jatStNLOB7wWRiQo5
         SL3xgZ7V3/bQ48IsRaAZogj4+mxX0Ew1WnGHk+kvPYg6Z/CA23IoX98pNN1Z8bZMGhod
         jA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728394238; x=1728999038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QACVQgD6547uPXKrZtM7F8hI6p1rVYBVTpTgVKbT+VM=;
        b=ad9emhZJzbw7Bn8E2U+5gP0+e9vUEQqeeT9VbB8bfLdt5NqkkAZpfMRNR8aHaLJVSw
         M8W4zihCMM+MsxrjrUfqz5IZHoLnMmrKeXxXpx220eNXIKSDmKoxG+uZMEckgFFIZvFU
         Vu5RqC4ZtPBRhqaA67Yu1HHTwS3GDOUD0Ym1pA70q2Hd1r2OJzgHtC3/YrNcg56xQ3Bv
         RMYEBwO0dINywNAJDIpa/42WpxYe7tdi/juUu0FyINq2tBdObNCBiYEee2p4fHq6qDNm
         6JWIfMkfEU1z8MUQcJv6eNztQjhCbSGjw5elFEkzD3If1krxiP5HMgmLWfaX548Wj+MF
         rQDg==
X-Gm-Message-State: AOJu0Yx1BNQaXTye7tRzf3yuMMiF+zabaPIDs+oPtkHU+2eo7u7VKUmS
	iD+9XJVQ3X8feklcVxdHZKCH7885wfUSxYc+80FdJfQKpNwlkrIRG+xVknV5RGWfci/hdjfk1yw
	6vX5SzOoOxJRrZ3YivzQuF3U7ymfXTwYkNw0bp5pXuCNQOpl6
X-Google-Smtp-Source: AGHT+IErHJn7Z635mYi86rCFyYoASqOMitJoxMdKdYtulGHK2m40Sj+2Pw+RF4cZOVfvK9x8u6g2BqPE5XHZCrBrKfQ=
X-Received: by 2002:a2e:a543:0:b0:2f6:5f0a:9d00 with SMTP id
 38308e7fff4ca-2faf3c50949mr80686911fa.1.1728394237834; Tue, 08 Oct 2024
 06:30:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240927-vfazio-mypy-v1-0-91a7c2e20884@xes-inc.com> <20240927-vfazio-mypy-v1-17-91a7c2e20884@xes-inc.com>
In-Reply-To: <20240927-vfazio-mypy-v1-17-91a7c2e20884@xes-inc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Oct 2024 15:30:26 +0200
Message-ID: <CAMRc=MeAMsRgrtgOKFC4Rps_KJJ7tjt4hYH5k0NYe8bE0J4sFA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 17/22] bindings: python: tests: add type stubs
 for external modules
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, vfazio@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 8:57=E2=80=AFPM Vincent Fazio <vfazio@xes-inc.com> =
wrote:
>
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>

Some details on what it is and what it does please.

> ---
>  bindings/python/tests/gpiosim/_ext.pyi  | 21 +++++++++++++++++++++
>  bindings/python/tests/procname/_ext.pyi |  1 +
>  2 files changed, 22 insertions(+)
>
> diff --git a/bindings/python/tests/gpiosim/_ext.pyi b/bindings/python/tes=
ts/gpiosim/_ext.pyi
> new file mode 100644
> index 0000000000000000000000000000000000000000..69d4b63cf54af25f9f029a68d=
36a9a63789ce132
> --- /dev/null
> +++ b/bindings/python/tests/gpiosim/_ext.pyi
> @@ -0,0 +1,21 @@
> +class Chip:
> +    def __init__(self) -> None: ...
> +    def set_label(self, label: str) -> None: ...
> +    def set_num_lines(self, num_lines: int) -> None: ...
> +    def set_line_name(self, offset: int, name: str) -> None: ...
> +    def set_hog(self, offset: int, name: str, direction: int) -> None: .=
..
> +    def enable(self) -> None: ...
> +    def get_value(set, offset: int) -> int: ...
> +    def set_pull(set, offset: int, pull: int) -> None: ...
> +    @property
> +    def dev_path(self) -> str: ...
> +    @property
> +    def name(self) -> str: ...
> +

Four spaces indents for consistency?

> +PULL_DOWN: int
> +PULL_UP: int
> +VALUE_INACTIVE: int
> +VALUE_ACTIVE: int
> +DIRECTION_INPUT: int
> +DIRECTION_OUTPUT_HIGH: int
> +DIRECTION_OUTPUT_LOW: int
> diff --git a/bindings/python/tests/procname/_ext.pyi b/bindings/python/te=
sts/procname/_ext.pyi
> new file mode 100644
> index 0000000000000000000000000000000000000000..fdcd8ac15f2a0cb9b900ef272=
b2a10818c8eef4e
> --- /dev/null
> +++ b/bindings/python/tests/procname/_ext.pyi
> @@ -0,0 +1 @@
> +def set_process_name(name: str) -> None: ...
>
> --
> 2.34.1
>

Bart

