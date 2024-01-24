Return-Path: <linux-gpio+bounces-2539-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9953B83B37F
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jan 2024 22:01:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9B591C20D34
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jan 2024 21:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 652AE1350DA;
	Wed, 24 Jan 2024 21:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CND4YbPP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95801811E4
	for <linux-gpio@vger.kernel.org>; Wed, 24 Jan 2024 21:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706130099; cv=none; b=tc4MB0XQQqMZ3BKLGi33KqmFtfxkERvaveBWdlxw+OkNScKz2ZTVDk6w3SlsRNIofFuFj4qvx1DrKA7Pes4Ne2fiZq8wc8OKOCNzZtJo4iuOKjJE00an1Xk5/pImjwoNQw5DOQLcJcICRO9aDs7+IoHnSOEkWRbKmtXMC9NiDWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706130099; c=relaxed/simple;
	bh=M/41WbYEl3XEqfFmtV3mHP8rgnI/cXDy8h/EVq/w+Zs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nr7+lREcya3sA0KIv8yFJyioiACf0KoJRJK5GG86gBeMGza/0yIWNSF5w3Qmh7EZNCklhQeImywfEu5CVs4R+pWO+9riTmG0A8t/+GC/kcUrDbhNvh9fTs9MX+WN8adDb4OsMOqU6NseRG2w2nzAg9ibVMlJlPA6g+y+c6X/wvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CND4YbPP; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-510133ed214so1416454e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jan 2024 13:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706130095; x=1706734895; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M/41WbYEl3XEqfFmtV3mHP8rgnI/cXDy8h/EVq/w+Zs=;
        b=CND4YbPPJ1JdcKo69d4Ctjmpxpr+cAzhqjzHJHyB1JotBRTKBWT/3M0DeIQ5EOCRxG
         UyPuuiTMUcna4TP9moanCcGAQS4i+pkDywecppVk7NYl8qspnrFqpHahnaDMwGoTCa+8
         gkjNU3Pf0NFWr8ngwIRdKx+3fKcCYeiyRjz5nT2iJiOgvN3xjbHsTQ93wHDpMMwamyKk
         aunv5fnv5nwiDmB9NnWSOmwnwbLzBQvnW+kPZF26N9OFr67BpfVJKaeALyYSOyvEHMsq
         pHkj8DtfmDVGHPo842bJfKz7Pyw81XkBikogrYfAdj47OSQSFuESS2G/wwr5PWtOL/Sc
         t57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706130095; x=1706734895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M/41WbYEl3XEqfFmtV3mHP8rgnI/cXDy8h/EVq/w+Zs=;
        b=rBPHPwQtYxXFt8Re2GUmZWOegQOf/gm5aQp5nZYB47CCtIDg/97jmIG/pydOd4nlvm
         qijbN0esjyyKfuGcmocMBy918WBmUegYeYIc32rh6glkV8kt9+4HkESMfFgAjOYEpRiU
         pAPAacPPmShgv0nmmHy82Lujb5LMT82IGo5MufeyCKLb7htQfu7QyKvHiR3dJKWz9PsD
         /wzAisVISk/8HUcVheq6IekPLO0LqXBZ+aNRL5p0LCpeG+R5vensU6eRGwTcMblEq6H/
         k7sNf/ph2w6JxhXu4RTVkDLpsVpo6+oTPb6vGr3N/pBr31C9TrvvnN1xGDicnPqHt180
         LXsw==
X-Gm-Message-State: AOJu0YzylxbhYQpTjn8hJtSG66pm9oTOXvPQo9fs3zEHibJ36i80x4Yk
	pI7h7RuEfwIu6N1gPtvqA+IuaSpkNRSUBSJF37w43HDSoGdpp3rfGal8g+2PqFY/d3zsqL7i9N/
	pQ2KIHAe85IQC1hWDF+dDl26PJqs=
X-Google-Smtp-Source: AGHT+IGJZ4w9mbnQh11lJn6BQrVUg8yJdwn30LR0KZ5zqlTNz0XwOclJIRvWDvAMCzKqSD4LuU0E+5GpWWa59N1EAFU=
X-Received: by 2002:a05:6512:3187:b0:50e:3084:4ac7 with SMTP id
 i7-20020a056512318700b0050e30844ac7mr4502202lfe.53.1706130095306; Wed, 24 Jan
 2024 13:01:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240124172438.2086766-1-ckeepax@opensource.cirrus.com>
In-Reply-To: <20240124172438.2086766-1-ckeepax@opensource.cirrus.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 24 Jan 2024 23:00:58 +0200
Message-ID: <CAHp75Vc92Y_E9f=SPrzpXgO8aHp8BbB84S6r-Zuft=Hx=3ymZw@mail.gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: cs42l43: Tidy up header includes
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: linus.walleij@linaro.org, patches@opensource.cirrus.com, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 7:24=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> Fixup a couple of incorrect header includes.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

--=20
With Best Regards,
Andy Shevchenko

