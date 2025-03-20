Return-Path: <linux-gpio+bounces-17818-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 824BCA6A195
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Mar 2025 09:41:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 613A5188B4AD
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Mar 2025 08:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE22920FA8B;
	Thu, 20 Mar 2025 08:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J9YSdxbt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02012063DF
	for <linux-gpio@vger.kernel.org>; Thu, 20 Mar 2025 08:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742459933; cv=none; b=cdA5+e+Dg/2jD1vMfcjSTnJj3FO1yukmbwZBg8t+xHmiM/2sQCrYA+ivT17+OIy/YtTqYHcMmR4XmzBivWWVJd4X9skNRL6CAO5LsQXytWsR7kD/+2LsmHtHro2ZrGKN1xoq1QpATKYzd9c56Lg+SJPwoYdGoFKamrjSzd0J5F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742459933; c=relaxed/simple;
	bh=Hjnm6h6VbKdAmP+BYdeTLnUhxywAbAPx3ODECnQc050=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vn2SXvH3O5l1I1LQLMwhz7loP/+LpWDkST4is4H9efUnnLFgz/ejMBdhQdajItz/25zpD5nyRXSrz4945ahohplV5EvJ51PNgyhL4c8P0n9PTCPmdqTmHFHvWjw5TRWBmsUooBHHJi+lgUCJzpII+utFy/X9sMhXIadlbrcEtvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J9YSdxbt; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30bfc8faef9so5700311fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 20 Mar 2025 01:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742459930; x=1743064730; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hjnm6h6VbKdAmP+BYdeTLnUhxywAbAPx3ODECnQc050=;
        b=J9YSdxbtHHUXIMaW8mrL0B3EeZIhVYTY8JbFpyFB9nk6ovBFGenKhl/Pi/5g42DD36
         rZ02aUr3nLTw85a6hy5rp5VxTJQDZ3/6ve6ezDSURsOK46kViehK4vFBQt+TSPa/5Bkw
         V9kls1s1tOy5aXj94BZ4SjPdvUmhZhM2qNuk73dnQ8enUyopwmBazqyUauyROA9XEOsq
         PGkBSBXHECboTJRiu7yDIJFqbxL+SAhqqOPtwDRatvKe/g5GVBSCinETGkWhK1ZHeDRt
         rNrk35eqxRYLIvciqBtDc+07I2fuB53INXz5ImhN4zKbvx/Lev/nEvWCR334md91PWSH
         kPKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742459930; x=1743064730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hjnm6h6VbKdAmP+BYdeTLnUhxywAbAPx3ODECnQc050=;
        b=YwLmAdx18x60oIGEiX2X7bJ8cWxuAxqHPo2WDjazNzO41q4oOZXw3MPzjnsv+Ox/7B
         Y3318NLDtCtSKpIv8GHiJnBZw8Jmzl9+JsmWCyAVi+rAWERW8f1EftnSLPTUBMsV+9hD
         hlRmpJ0J9Fqr3wuenWyZRM1uSQ3A81HccvOonHTcz7p1v1Ss00+X34ymSw2s7r8MC3D9
         psuM4wmiQRNREaxmzYXBZ3LLzCBHVDz/UApncdVTdhZXxdyFYZ7raci5CyOXG7AbFl5H
         mSR9tbERpA9vNYyENLMHq5gSKTY8SKd0EToE6Tm+s+4a5xjES3XX4iOw/10BX9poQxPf
         cCUw==
X-Forwarded-Encrypted: i=1; AJvYcCXo9w/w159xeIhKV+7jneK1ZLhaYYw6yDxIS5wX8+1ev5F1Z5lgU1tlpr21F+RCSFxGZMFcZgzPg1qr@vger.kernel.org
X-Gm-Message-State: AOJu0YwFy8qp5CIYahKOBYb0tEhlnPqQu8CQX3Fb1a4NdmkC+N8KCQxC
	1t+ahkPvNu7kqdO4n+Pix6xNkbo7655kE6Olp1WlrRjU58nRCBYTFFuQjWkoOA7YlOTs8D+LIdK
	P1KOatGFt2KGT6rEQuLDnECo5bSsxIg1KW+RA0w==
X-Gm-Gg: ASbGncvcfnUFphXcgtpqek1LuAWNfM3P9sDMO99GMeXYIZqHqe7YWiKAgCufuGTOorj
	0ioJm03+mzM2PKn1LPKIIf0ShBjNaxizUFnu+TUF928RvC5nQuGWW4incMdcuBa/4H70WNkFzU5
	IeFeLrB0I2Jg5QmNQC1dFRcUM=
X-Google-Smtp-Source: AGHT+IFD4w4hNXYvruLDdSQP6C1+rIqqCVvC3QD11WfLjDdRrOARbFWNTEqGlnQSTwkwpoQx+WoFOIViXCqCm2xtkIg=
X-Received: by 2002:a05:6512:1255:b0:545:2fa9:8cf5 with SMTP id
 2adb3069b0e04-54acb22df99mr2287327e87.49.1742459929900; Thu, 20 Mar 2025
 01:38:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319092951.37667-1-jirislaby@kernel.org> <20250319092951.37667-48-jirislaby@kernel.org>
In-Reply-To: <20250319092951.37667-48-jirislaby@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 20 Mar 2025 09:38:59 +0100
X-Gm-Features: AQ5f1JoIspSXlQN4dIKbOu1jN3twH_3GYAyvghW85Pzo3hZCWpBv2464HnjyEHk
Message-ID: <CACRpkdbJ-SryFs=dhjJMtUXRP8LLOyu4wYVcu3T--OwagQx_Cg@mail.gmail.com>
Subject: Re: [PATCH v2 47/57] irqdomain: pinctrl: Switch to irq_find_mapping()
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: tglx@linutronix.de, maz@kernel.org, linux-kernel@vger.kernel.org, 
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025 at 10:33=E2=80=AFAM Jiri Slaby (SUSE) <jirislaby@kerne=
l.org> wrote:

> irq_linear_revmap() is deprecated, so remove all its uses and supersede
> them by an identical call to irq_find_mapping().
>
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

