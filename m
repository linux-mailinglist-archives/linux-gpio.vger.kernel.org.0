Return-Path: <linux-gpio+bounces-11058-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F9B99502D
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 15:33:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D8AA2815D6
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 13:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA5051DF971;
	Tue,  8 Oct 2024 13:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0UWGo1bN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25AF1DF75C
	for <linux-gpio@vger.kernel.org>; Tue,  8 Oct 2024 13:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728394411; cv=none; b=CFdHBejI0Uh2Zx07TCvbAoCb+PhOZFrANYihN4ZKUS5iCxZFNfSe8VOETSFS0wuZfRc29iX7DZtDVcjZfUv2jjiHvUGjx+qO202AXBcv0lsOy27TO88q8iJECEGnBEeo5udB0MLJ3t5jzSs7p8z+8aA5B5Dq2VBLKng/fms3NAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728394411; c=relaxed/simple;
	bh=kNBp1TQZd2xxOtLx6P2OeN/9daOl5R0GhlhRAsb9yxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hZvEsbh1//D+W1wurrO+K1bH/SWB8M1QVrvTO5IsPY1TzhyZGFBkiPB77JKFc4CtyiMlxen3/L0+MPSgZXW5GHE3EQxb+Ek8mr0ngM82gKK7ltsiO5q+miMQWMJf/qyYOKNUP/d0sVK1k4YbqlDaw8ca2iX1QE20JvvyLXL7qHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0UWGo1bN; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5398e58ceebso4894282e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Oct 2024 06:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728394408; x=1728999208; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s0OVgjgARuju2vnvrh+zuYqBTsK5MzZdxK08npg2RvU=;
        b=0UWGo1bN5MxIqy2W+V4RNGTLQuN8RuE+xDkgQ3UPCuNKu9isppjA+9nMxDFWCrHu9F
         Yp/UrmtJmrOyJThrBX0df3MW3sS8HmIV09FbGrB4SR0asNdj3OIvpoq5V1gJv6ly0SHR
         ja9dHv6yv+k74eB5qdQoQcOgDK3dKlJNU7vZ3Rmd2+CzVO3INR60HDCvNwftyz1egOjh
         3/OTOw6qtItEhULcTbXlhxOFg0CKxb0nPPs+xMPD+d/eRa64PACYs1VCV6hKG0HmsXuy
         694xA6VYDQ5GnyzeAfpNZwnZA4NKUFu7XSyl1tCvYQd5S6H5ls9vrnfNilTMbNA12Fk0
         eaSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728394408; x=1728999208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s0OVgjgARuju2vnvrh+zuYqBTsK5MzZdxK08npg2RvU=;
        b=Hoyxc8h+b1GIj0UPS0lPvqLXE9qhLdHlHofgx6DHnGJBYZawckluxUGMlTPYPxRMaW
         lswHmTAjHpXjKlkBw4Cnt7lDAxpM3cMgZllQQGmmKXPGwh4wkUo6RfIfmLJZsgwPfasQ
         ZXs8DeF7r31HkhuOT+38v06SdeVpX6ofVUIXkzVdgtygV2Cl94nnWhjHhRBiUwqmSjgj
         DlJnwFSmUg0+NmtCkgbBABLCIvcUX1tKNVNb5a7Rx5PAY1QMFNUBEhc987xfGisadDKb
         Hrr40FuXbhp90gwtkzBmZXt1A9fstW+5l8J/ISDsKWjiBGMHgoUWsxTmMuAXxWaq+tzz
         0prg==
X-Gm-Message-State: AOJu0Ywj90/6fl9eGeI8TiwLPr9rC9DwBIZ/BSKQ0gZKus+jdQGRkIh+
	ntforVqxYHbbRw0dgtHQ6qj/fpZdUKK0iNJ/Hl6k4iX2qOcQCiTXsRoO0wq6BS/SAhPoscKMqhB
	c42aG0/YXSPhCFLOHYqUMmnUA9sPk3xcax5hvUg==
X-Google-Smtp-Source: AGHT+IEO3fucAfxX+E7YovHLhWWOu1wYFvH/wdRpmSKGQ2ZBVoS7vsJyH7tD5a2w8+lFSfXjCS5RKb/zxjevYdBa2jQ=
X-Received: by 2002:ac2:4bd2:0:b0:530:ae99:c850 with SMTP id
 2adb3069b0e04-539c2b0d17bmr49571e87.1.1728394407849; Tue, 08 Oct 2024
 06:33:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240927-vfazio-mypy-v1-0-91a7c2e20884@xes-inc.com> <20240927-vfazio-mypy-v1-19-91a7c2e20884@xes-inc.com>
In-Reply-To: <20240927-vfazio-mypy-v1-19-91a7c2e20884@xes-inc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Oct 2024 15:33:17 +0200
Message-ID: <CAMRc=MeQedMqR-qdmBe+J8SLX-TgF5Yu2uSaaRb-WhCC=GpPmA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 19/22] bindings: python: tests: ignore
 purposeful type errors
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, vfazio@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 8:57=E2=80=AFPM Vincent Fazio <vfazio@xes-inc.com> =
wrote:
>
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> ---
>  bindings/python/tests/tests_chip.py         | 12 ++++++------
>  bindings/python/tests/tests_chip_info.py    |  6 +++---
>  bindings/python/tests/tests_info_event.py   | 12 ++++++------
>  bindings/python/tests/tests_line_info.py    |  2 +-
>  bindings/python/tests/tests_line_request.py | 16 ++++++++--------
>  bindings/python/tests/tests_module.py       |  6 +++---
>  6 files changed, 27 insertions(+), 27 deletions(-)

I need the commit message here because I have no idea what this change does=
. :(

Bart

