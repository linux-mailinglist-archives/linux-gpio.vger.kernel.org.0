Return-Path: <linux-gpio+bounces-24765-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E923B3008E
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 18:55:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6106B1888D55
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 16:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 024C62E54A7;
	Thu, 21 Aug 2025 16:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wkWlqK7d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3C42E282D
	for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 16:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755795053; cv=none; b=RnDNSL/uHWuC6gRTrQBWDWIHMj6b++HXQJdEUC3U7wu5bRD3IfxzwFq3klfcP4n+qCTMu+Moews2E0HUPXE11emfJVgqpr92TKLA+32VHOcLrkIHXFQORWtKfqwdktxUtAavuuFTT/o7iWjUBQd6+NF5yo5pdyK22csLC0pP0kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755795053; c=relaxed/simple;
	bh=MA5CoRznscTD/9JPv2I1fgD+UFpMWzRT7Bcr37nG6ws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lQXUqU+8wbPVRbi0ZNgvdivnhrbbjAzCcBi2SOlBcHL5C+4uYV+8TEIELb+FwgHIQDNdjeiVCBeUKqNxpRk1UzFeYxnrT2n/GQyRsMPHzkadSlCPYbPEcO0mgdQvbmOBSkpTR4PtlAnV3pQ7Z8+zDEglizAEMKsJLj+Bh6Y86/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wkWlqK7d; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-33541f0ea9dso10212321fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 09:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755795049; x=1756399849; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MA5CoRznscTD/9JPv2I1fgD+UFpMWzRT7Bcr37nG6ws=;
        b=wkWlqK7dAOZ1y+MgUubgf3rcCYYAXyFlwlaf6n4BDE1E8OdI9GvbbFHWXkFl/JUFpg
         QKfV51wUQLLQmaYPN84dofbifww2acVr069Lix2t8jO531wrxko2uFTV43AqOPGFcPC2
         WI2CIbzgrmnkREqIIFNuu2TPj9+XqcicbgOur3++CAajgcp1uC8YwLk5Fwy7lmsjwGok
         75qkS0ue+edCqf8SETxtdazBQpUu9ZXtTajUIpPtPT6xsd1EBJvuWNjHjaa7OPUO71m5
         bNJnhuWZ4pei0ddwxz9G8ZSvM8adFkmUF72vyFqcPzooTr27LGesDsqJ0Z61m+Om3WsQ
         McEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755795049; x=1756399849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MA5CoRznscTD/9JPv2I1fgD+UFpMWzRT7Bcr37nG6ws=;
        b=ELbbX2CyEn77YnPRUxBcquaWxtk/t+X1TMUxkl7o31+9kIJF+tA5MplJ1dMJdXWdSr
         rcSM/mjNC42qPiUpZ4JSS9qxeOZFy70j2DSnK6qyj0MK60ae5DnTzErwbZYKbgC0h7V6
         ioytw78WU3BSXlHYKpX4jTqTICShPrBx+qRH6BjE2n/H6MJ12cI/DlqYvsizkG6J+aaj
         0ksqNhHBVzwTEWpYMFvFL6M2z6iwuLA1YWmaodvZ3qMbDbFM5gAAD9XNe3wRxV0DHVHA
         MM8jnUX1/IzPfk5hb3V4PaQgP7Tj0T0mmy4iE7Q5wz8WAn3HX8XvhL8ga38pSh/aXF/B
         3TvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiJFEhvqGPfhamkad6FKgozKOmrgVXgamGfb82LK544o+y5HrpntES5l4sfSfkZOr8uoKTqy++6bBD@vger.kernel.org
X-Gm-Message-State: AOJu0YybRCRn2FSks5pjIMdWRLTFcUPAkul4fpWEVvmth/ThTEqA8FXI
	7OWfg1lycRXura2zO6kgHnlpAFVfs9TKPJS7fkAzMR79NchShbWC6m5wfH/AEVHNlwwiBNo05O6
	dfg54LqVBW8Ao36MEVb5p6//DwnBKXmN6zPkHic/tSw==
X-Gm-Gg: ASbGncu7B5XGJ0YEx/oAQcX4craOroRMLZcCIkRk2f5LZvdic+hzyKDpzbKxeOtL2T9
	TeTM2RNesbrsCvprqg2D1wPXEDlX5fQ7FdELE68Sb75OWxNiw7rE93UdJsNjesp6JxaR1WemIE+
	VQQFOWtihQJrck2qxM9A2HbaV8AnA3A5HHkLTo39dKEWncap+KYbyd2fNXf8sJsB42P5UcldjJg
	jOunVilPkxBhvTOmQ==
X-Google-Smtp-Source: AGHT+IHXxJmnZpxwlzV39CihpI1fip8jHsQ3wqrQIPStR8+WqibfCJ2j76EEt47pzZKFul7hhblBfkLJ4pGoe6B1jMM=
X-Received: by 2002:a05:651c:23c8:20b0:32a:78f7:9bef with SMTP id
 38308e7fff4ca-33549e3ad61mr6524161fa.8.1755795049223; Thu, 21 Aug 2025
 09:50:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250710002047.1573841-1-ksk4725@coasia.com> <CGME20250821124039epcas5p34b77813c9936b8b70c801e0e1b67891a@epcas5p3.samsung.com>
 <20250821123310.94089-1-ravi.patel@samsung.com> <20250821123310.94089-6-ravi.patel@samsung.com>
In-Reply-To: <20250821123310.94089-6-ravi.patel@samsung.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 21 Aug 2025 18:50:38 +0200
X-Gm-Features: Ac12FXwqIo6zLlw0fIpSEAb-CCiAQ7nCYe-8wPk85-SMsx3heqK_K_zSrsS4110
Message-ID: <CACRpkdbdpcPBC8mwazoXHy+HE+hH-XWDkfHV4Uz38YhZU7UH7w@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] pinctrl: samsung: Add ARTPEC-8 SoC specific configuration
To: Ravi Patel <ravi.patel@samsung.com>
Cc: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org, 
	s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tomasz.figa@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	arnd@arndb.de, ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com, 
	gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com, 
	smn1196@coasia.com, pankaj.dubey@samsung.com, shradha.t@samsung.com, 
	inbaraj.e@samsung.com, swathi.ks@samsung.com, hrishikesh.d@samsung.com, 
	dj76.yang@samsung.com, hypmean.kim@samsung.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@axis.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, soc@lists.linux.dev, 
	Priyadarsini G <priya.ganesh@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 2:40=E2=80=AFPM Ravi Patel <ravi.patel@samsung.com>=
 wrote:

> From: SeonGu Kang <ksk4725@coasia.com>
>
> Add Axis ARTPEC-8 SoC specific configuration data to enable pinctrl.
>
> Signed-off-by: SeonGu Kang <ksk4725@coasia.com>
> Signed-off-by: Priyadarsini G <priya.ganesh@samsung.com>
> Signed-off-by: Ravi Patel <ravi.patel@samsung.com>

Looks good to me.

I expect that Krzysztof will queue this and send
to me with a pull request once he's happy with it.

Yours,
Linus Walleij

