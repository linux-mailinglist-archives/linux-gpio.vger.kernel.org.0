Return-Path: <linux-gpio+bounces-4752-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7463988FB58
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Mar 2024 10:27:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 004E2B246D6
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Mar 2024 09:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01F6B64CF2;
	Thu, 28 Mar 2024 09:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v3jrSrfQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D7056441
	for <linux-gpio@vger.kernel.org>; Thu, 28 Mar 2024 09:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711617958; cv=none; b=hhYMHC8+luVpy1NqSzaqGK5ki5FOdo+SHDgAkyAYXN9gFNmRGnF5pFUhq+fk6TRUJ4xnya5aYe2waMRlGKo8ECcAhm6awThGgqwrzSmyjKbSvWWTMlPXNvcdgkEuZRIljLJZfntA09gXpsi9CWyn75O0LidwH7uZbo/buK0IRUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711617958; c=relaxed/simple;
	bh=lW8QqTmIIY5WWx+5Qn+Qztgo2/CDJTQmC1e6LI+YfA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZgUespo51ECXQPPwgom7oXzVi3yr+CizrOUvBoTzsvGl7T3PUpsPKGPdTTSlaAz3S2T5+cG8kpkCMUZiPswjg5Ae5A3bTVkwSISyt95QCz4hKOUI/IQoOh7eQgv4Poy8Z2ttfdpti0t3VNhCRc4OJ7e8xK1JfOQ0t7Y0LrJZ+jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v3jrSrfQ; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dcbd1d4904dso693408276.3
        for <linux-gpio@vger.kernel.org>; Thu, 28 Mar 2024 02:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711617956; x=1712222756; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lW8QqTmIIY5WWx+5Qn+Qztgo2/CDJTQmC1e6LI+YfA0=;
        b=v3jrSrfQ7otb2pl6j3f+M3wl9clduYqFmhPX2yXMypjMpSBGMPxUzKYFw5cSMvIIf2
         CRCRRwF1/HXeuHD3XmaGVAFeafjBT121aX0zXXdL2MHTELLleoDriGz5r2mgIxoOaeWD
         vlbr7Z5csk+Jv8cMjEDqrJ3o2GPrYngJ2Sy3iagDAD9OCQ7U/l8mHywLhrm1RtzemmFl
         c2REYacBxvOE2sZvtwJVMU4Nw1WjTWccNsjzXcx+ILFd0qeNfnWUs4Z7VMTv6Rw2uFln
         0/2yfHlY4ayktljtFDMvwJZpday2emASH0Dei2uke6eW+GjH5K41TxfT5KvbDKlYsf7O
         9HbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711617956; x=1712222756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lW8QqTmIIY5WWx+5Qn+Qztgo2/CDJTQmC1e6LI+YfA0=;
        b=EdPo/Uqyt/Y5OOnDFc2H+9q3Se56Rkvdeb+yj164n/QOLQllK4te5L2PuhB+pVI0G4
         nrSNxWctHKzXbABJseJblCjayetpBD34NpPGpcBmuSCB2xEhpNKod0kgLObYPwXFP7u0
         IPgXT8AeDBtiu3DpacH4B93XLogE1+d0oHwa3Hl3+mfzMAhHfATj0IczdRROJraatDnz
         gpc9GNNDUxKV3OUcmHwzgKqh94axffZU7++40xHP15fVgg/6s1Zv4jNrQUX+zo8NhQ6s
         xSUGF9mWTA9ZM08IXvfKG/mTax0l/YOZ4/Ks+YIScLjWNp5U6vzEF0VKnFt37xwIz/Rn
         IRxw==
X-Forwarded-Encrypted: i=1; AJvYcCUWPoKsOb2b/hKu0Cu0Y7cdAyNescAyKAgzPf7B3aqpPQKSgBkkwpjSo6RLPFSQaT33LTvbJLjPOyw8J/r0xNT0cMB2LyvDCEv0sQ==
X-Gm-Message-State: AOJu0YyrRY+D3eUCEOaNR/X+QJ9l4s5NBss+tqqwLGERCYfq22pYl1yq
	tN2n8ahmEkvbuyXK2ytdd7i8zsVWKBFNPtaSLGCp6rRAsadZQmxuu1Bml8ZdJmGlHU7pm8mjG/7
	DjwL2H9Gv2KfpQHtd7beHinH0e+/nUdAL16f8EQ==
X-Google-Smtp-Source: AGHT+IEh33r/cMIL950w9pM6WTLyu7qyZj+WM7cEtQOkKt3p9m3geR/QDnirj2kZX/VA91a5L6wD2wnlxO8fyT2VdWc=
X-Received: by 2002:a25:c244:0:b0:dcf:3aa6:7334 with SMTP id
 s65-20020a25c244000000b00dcf3aa67334mr2478797ybf.7.1711617956166; Thu, 28 Mar
 2024 02:25:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240326220628.2392802-1-quic_amelende@quicinc.com>
In-Reply-To: <20240326220628.2392802-1-quic_amelende@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Mar 2024 10:25:45 +0100
Message-ID: <CACRpkdbq5iTz6azcdSmsUiaOi97coz_XDg28RwU1GL=SQ3uXKA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Add GPIO support for various PMICs
To: Anjelique Melendez <quic_amelende@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_subbaram@quicinc.com, quic_collinsd@quicinc.com, 
	quic_jprakash@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 26, 2024 at 11:07=E2=80=AFPM Anjelique Melendez
<quic_amelende@quicinc.com> wrote:

> Add GPIO support for PMXR2230, PM6450, PMIH0108 and PMD8028

All patches applied for kernel v6.10!

Thanks!
Linus Walleij

