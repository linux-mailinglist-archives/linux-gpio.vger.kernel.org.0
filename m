Return-Path: <linux-gpio+bounces-10748-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2790E98E2BB
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 20:41:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF55E1F23660
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 18:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0393E2141BF;
	Wed,  2 Oct 2024 18:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sat.qc.ca header.i=@sat.qc.ca header.b="g+m648oQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAE42141BA
	for <linux-gpio@vger.kernel.org>; Wed,  2 Oct 2024 18:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727894479; cv=none; b=LSCEpRnlIf3cbZ3smD6/pOx7E1FHkrWcpRFmb4V6CR/d5lQzv4rUt0Q54fjfElSFWGXR8XPT7KtF8cOADc2fZDMKKOqr0GaJ5stUEPU05/+bNhxvi4nXjR8MDFd0Zuv2evlC8Z+0fm1nztYraTwJqHBXCp29kAQUuBGwbA/TtdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727894479; c=relaxed/simple;
	bh=QYB166CEL96dIud8KGaPeqQ15U/uMlniHSRdrGp8mtk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=k1VQI59iX5m3HWn1elk/K5Humlr/mtBLsO7dRBwISQCn3NlFYKbzClBtcIBT4KlC51wqvQF1kz8JtcySBE06yG1HXA4nM6FQ23E/ZPhhNVaZ/MenR5A8yGJ6nEv7BS69Brb0V8TWfPmOas4UT4ESdPOPdyeeatN4o0a2bt4JPM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sat.qc.ca; spf=pass smtp.mailfrom=sat.qc.ca; dkim=pass (2048-bit key) header.d=sat.qc.ca header.i=@sat.qc.ca header.b=g+m648oQ; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sat.qc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sat.qc.ca
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-712422564aaso551738a34.0
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2024 11:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sat.qc.ca; s=google; t=1727894477; x=1728499277; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QYB166CEL96dIud8KGaPeqQ15U/uMlniHSRdrGp8mtk=;
        b=g+m648oQnOdgnGm8SP8QgEPeezp8W1mGClAESdifH7kxpI4WmeLyUsqph75udfSs38
         hDKsgpzUn/ERUo29O0U5YJ+Drjkj+uHemCtc1iE+/B+tUugs8YDbk7e+WwbRxWBjiMy0
         u2Y/Lnot1hB2s7w8b/yLgjVE+POGmhIbDt6ij/O1EkLtH8gtvJbbpk8Nnv57DqxLGzh/
         Yo9ZOc5Ss+gzdwZMdWWYCgBlntudeC8qEfomx68D/XaNZvZ4vw36t2tT4h2IPd/ZtkSW
         6VCTmFU+6d/NTnm19SMRZAzN4FNUZH4DB5LMp621PUkxdZBS1yP7Plypr5CO+nLDwd7a
         gkGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727894477; x=1728499277;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QYB166CEL96dIud8KGaPeqQ15U/uMlniHSRdrGp8mtk=;
        b=evdOgBKowFZ+JDNYXKvMmgrHB5qUlLvVzvMwXeLn3nOuTaH0bi8H+6Oe2uaN/Xg9kW
         DQklgVnXGlBI0UfNcXW8youffTKqQBcmprEETEMBAHKqedK4eh3SSD27unvm5X6+JOpI
         QqauP4esx97aMrGdNKKeu8gzqD4riCPt/8rkMK5kebuCLO2UfocD7//ApU7wlsKepwsR
         M/4a/TIxJtCOhbU3i5A9ZV6OosTVF9XkfCcDhOVyjOiD39nBHpwN8bgF2oN1mAYjkSv4
         EJdi+7ckrGz3EsSwwxU4UuZuTE/J3MXN+ON1sJ43+dBZofn/IC9379facPpLO0gNVe1Y
         O1Qg==
X-Gm-Message-State: AOJu0Yz92n4iRjOjyYbSUPbqPP8cIL6dgyx4wMqzunArjVtmP3hV+vK2
	f67lG2AOVUeBigYjjJPmLn+P1c9/Mu9QGqa1sE6x1at0Z97LRcf5saMTEyJfcs3lvWXbkHRGd0w
	KYPL+XsOsMmRk63MEq6EjX1TQtHTVpunGpNKUMDQuR5rf/qLrrJ39NeEt
X-Google-Smtp-Source: AGHT+IEMzLppBtvIgWkmj0alhaOdXNSKJKUNVN3/HWfHcMoxG1cugNp/AEIBnAN2bHwwwZL9iXzT7nYXhWOc11fFVdk=
X-Received: by 2002:a05:6870:7182:b0:268:282b:bdec with SMTP id
 586e51a60fabf-287a3e35caamr307924fac.8.1727894477115; Wed, 02 Oct 2024
 11:41:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?Q?Jean=2DMicha=C3=ABl_Celerier?= <jmcelerier@sat.qc.ca>
Date: Wed, 2 Oct 2024 14:41:06 -0400
Message-ID: <CAA=GyxYyTvweUa1SWGeHkdtRRNuhFTri8cPTrFQY6pO+84vS0A@mail.gmail.com>
Subject: PWM-GPIO driver: how to configure it?
To: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello!

I am curious of trying the new pwm-gpio driver in Linux 6.11 with a
Diolan DLN-2 chip, which exposes a gpiochip accessible to linux over
USB.

I haven't managed to see where the configuration options of the driver
are set: for instance, let's say I want to create a PWM output channel
over gpiochip1 line 4, 6 and 12, what should my modprobe line look
like ?

Kind regards,

------
Jean-Micha=C3=ABl Celerier
Soci=C3=A9t=C3=A9 des Arts Technologiques

