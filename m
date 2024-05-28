Return-Path: <linux-gpio+bounces-6730-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE7C8D1A79
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 13:59:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E7551F23F6A
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 11:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DB2116D323;
	Tue, 28 May 2024 11:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wvR3m5ZZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A6A16C871
	for <linux-gpio@vger.kernel.org>; Tue, 28 May 2024 11:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716897531; cv=none; b=KZJSA7E/03VYcyQKWRG0+HZNyFG7Lbce77ehlnVKYLenQ+8VFsq4iAtan03cbMPlkdCQAaKZIrVW9dG+mIlDww5QeCMeLz0DfKSNBYOUOZohXHLEp28ZvhotuO+zmOHBE+XkogcAyvZqU38MaF21Gi2KzkfjU0eoIEXtiMfcZRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716897531; c=relaxed/simple;
	bh=XYEcwBrn2ZuAVxK/8OUQeCzOCxQyqvHA12tGOH+svqk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aevywr0RM2AoCBtebomvCFEUA1IIUSXkT0dYySTzKEnBhv0dkOhhs4XZ5PM0rh9Cl2NajK/PgXyBP55/CuaBdyb4qRUHjTTcbpdpWhcvuyYowuwZ0Fd1qdzcVjDVPEyMWHbRYyMRsJOZng+TUtgvb7E2HbRcWDInsYZEjFgJEYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wvR3m5ZZ; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-627dde150d0so7655397b3.3
        for <linux-gpio@vger.kernel.org>; Tue, 28 May 2024 04:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716897529; x=1717502329; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XYEcwBrn2ZuAVxK/8OUQeCzOCxQyqvHA12tGOH+svqk=;
        b=wvR3m5ZZpG9TtziiPqDPQd0C34yd81oJCe8YxiDKUc7x3yDmT7O61VeD0EuhMNMEfA
         JPkShAzEB05xK3MwdHG0UN53ECPH+FcKzBaXBYzvmFZFg73NSah1Cyl4QLhTlS4DN9Xw
         y7Xu5ADr6FQgPeL3KBt/snfKfeCGH6cu3osGRYmwamijfnjbQqGsSoENKN5kyXnmOT6m
         NkJxGf9W7QKX28IlARln1KP+2pS0jF9P+LfCd2gRSgBbzXglwdJxWq5+JsQE/XWHP+q0
         L/j8iD6b/QTfd3PIyTEIhFdySbTNKb9YgYyR5jLd/Vk1wbP0Vt6YReX+QHkdfHlSu6X4
         7F8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716897529; x=1717502329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XYEcwBrn2ZuAVxK/8OUQeCzOCxQyqvHA12tGOH+svqk=;
        b=LPCEWF763lTuFXx9QLZ4xUtYGzqSJPWYXFuqxErC+ZeiEwI/y7Cb+HEctcT4tfAB6z
         cXlTYdMTzoN7FhXZI3CY4FYIeN4Lc4zHJWYaWpmR1NUcF78mCCc3wxM9KPXJoqnvN9r3
         GOgygpXSLRSja+oisqMTMSCOprINv/AOhumL5dnbJ352e26dm27gwOYw4MBUbacs7bBU
         9US0MMOKPAzGygigaQvAZvs9GDdYIzHje9ymMVfNt0LG24h48SudyQ60BUHCax6L1v7b
         lsbkubhdC0DUgs9+DIndmGz0QHTS0oz5Z6GfDpAb+H/v596YK2swhkkK1TxhBSaoVg2v
         Xo9Q==
X-Forwarded-Encrypted: i=1; AJvYcCV03Rt5i+goubPgZqFCHCoBcq8LziIDfA8mdSyH25+fFuEEdBM9Je7foDxvWSbkGQyqpx37sFHN6zkQgKXCCEdGinIiv/EDFsFM1g==
X-Gm-Message-State: AOJu0YyyWKHzpjPhhxtwWM2K2DHhM8JZ29nhn/UbFEuGb4GK3PmX7Pu4
	xah4nzVVmLNbdKWoqwzO0OP3+AszJKxRRI4OTW3TXb/k7HcBH+5tRw47IqNi7eili/MV+DQWHxF
	0IZfRWVG2jGeJlrh43Lqw8qC5O5pJoe7aHiWVQA==
X-Google-Smtp-Source: AGHT+IEi2FFXpJzm6Ui68LI58fiW+9ORaUI9qMfSH5fZ2ghY0PYbSNMQ3NXlttGGYAUDF59nM+IzQBpvFB2cxXuz9QU=
X-Received: by 2002:a81:92d4:0:b0:61b:33f6:9bbb with SMTP id
 00721157ae682-62a08de4efamr123625807b3.28.1716897528671; Tue, 28 May 2024
 04:58:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240521152602.1097764-1-patrick.rudolph@9elements.com> <CAHp75VfpFtYtStacY68-iu32x-XK3XMn_34N7EH07vvhjwp36g@mail.gmail.com>
In-Reply-To: <CAHp75VfpFtYtStacY68-iu32x-XK3XMn_34N7EH07vvhjwp36g@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 May 2024 13:58:37 +0200
Message-ID: <CACRpkdbFVpZhF_RZEeZf06PRq-Sf1Z-8apUbnaJAFDaQt_5xMQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: cy8c95x0: Use single I2C lock
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>, naresh.solanki@9elements.com, 
	broonie@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2024 at 7:25=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Tue, May 21, 2024 at 6:26=E2=80=AFPM Patrick Rudolph
> <patrick.rudolph@9elements.com> wrote:
> >
> > Currently there are 3 locks being used when accessing the chip, one
> > in the driver and one in each regmap. Reduce that to one driver only
> > lock that protects all regmap and regcache accesses.
>
> Right. But please consider converting the driver to use cleanup.h.
> Dunno if it requires a separate patch or can be folded into this one
> as it seems you anyway touch almost all mutex calls in the code.
> Linus?

I think it's best to add a separate patch for this for bisection,
just right after this one.

Yours,
Linus Walleij

