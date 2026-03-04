Return-Path: <linux-gpio+bounces-32522-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EG42N9nFqGlaxAAAu9opvQ
	(envelope-from <linux-gpio+bounces-32522-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 00:52:57 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC902092B8
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 00:52:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B1AF303CD34
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Mar 2026 23:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 981243750BE;
	Wed,  4 Mar 2026 23:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JeQDzC1m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BD436D9FB
	for <linux-gpio@vger.kernel.org>; Wed,  4 Mar 2026 23:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772668285; cv=none; b=phHOZ1XMa+a+7uvC4JxznYGQgpbIuCjQdg5lCAOkrQoRkal7zYeIduOUkUtveuKgoxMeLB6tnlKllnsRILTCRRmQgSE8kWHgDLtjzuyS2CxxjAfMQ4E/hWRd5nFb2q1DYutSoFGrK0zfbQAvFigliGoqLnWen5ru0uFkzOkoowo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772668285; c=relaxed/simple;
	bh=9mVxnKjSFYiBuhNl/RjgU/loEcC6J5udkYZhHtn14L4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QOX+nQcUF8ZVtGjme7535QtJrS9EJz3hIxwTT4dqEKCyGnP43Ux3PTF43QASmgBdEWni2wSSNesL5/gPjrMXvAdQWDFajZIPBI1ACR7PWO6i6OWcdJYZEnwutIAjRugCLaaFR2E44FwAkNGErbS1s5LrrPFBvEBDFduAVg1CNgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JeQDzC1m; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-506a93ba42dso78359601cf.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Mar 2026 15:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772668283; x=1773273083; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4FxY1mP5rHuQJee4LHID4+UTaMgFOvJujP6Xo1yweSM=;
        b=JeQDzC1m8DLtRNFTSgRRrApsgFrXCVU43HANgLXZqrj9mstUK/o1JZC88TqBBIRm+R
         P2wUmS4rnysvaKQr1TfhSctKXpICbiTSoQayR0igUxBqQWKwg0KgcTDecAcityxELTju
         DtZFMghoJSM5M4FFUqIbxhXB2lVCSdkYaIuvuO/S8OFN/GDFOhYBvqjqiMCe+fbJWq+b
         lfvq7S7fPjvKAO8JqzwjLrd+8ZpbG01i38R/DzXZ5vpNxsM65BMBUbdadls852uqAcjE
         HP3QzvbOp8Ej190zoIfo4qFMnGFsEKsr7PywQmCM2081ClVbH/gjCk6PL1W+EWgB6+5P
         CsBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772668283; x=1773273083;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4FxY1mP5rHuQJee4LHID4+UTaMgFOvJujP6Xo1yweSM=;
        b=QxKa1b+QmwgiWqxVEdbFRLuITcw1lGlqMFPPuifLcNSAfh/WkaW7TBruf/ORuy5PUk
         zOHPU4E+pGYxKZcSiSRjpq2jj0cm1jQJY94lSvzlc1KCVETd6Bh5utbKANqo85/Zvv/a
         nSjNFxdg0zvbWnx/NFJzcyOrC5jitKSLCQOI0euFitqX89uBKAc2FUEKN9KbMQ/SGaLI
         O1sq4oyXpEKhxjgn/VbY/a7qJHpqxJ5erHh8CsRAWEjaM/uByjB2PVSlDzLkj5d1bPVR
         5ITrCoipg2ICLf7hnZc43v89e27oYR/vQtE/eR1J/mlhjV2ct0PSjdt6PnczZRSA9/l+
         FZVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWg7mhqiwQ4cb7r/k8JG1C1ShqV94sl/FKHZMTqo80AiTtdRV/5diX8I6J+WZ0P+g7G21adml/JHtY@vger.kernel.org
X-Gm-Message-State: AOJu0YyhrT9A/ud1okJYXf4hPfY08ADIUgeu/1TUQduXaCE1b1Cl9H0y
	LvbrpoLColkAvNCoKtBxf/6k1QA2SSaQ98gb4+KxLIu3Z3s2SkwouQep
X-Gm-Gg: ATEYQzxF5RKs56sWYIkWDjiObk3TLyaLAYnDkKoHhG3b8wGEb+i+bi7iLvETh3ADILd
	aTLbY7SD8VF0ostEpLH+PtNAbPfKN6ahrILKgN8/RmbcOfn34osbnObII+0GZvCr9e4pmlRLGDz
	5dDL2IqL5WTq18Hrlbs8hori7iGo9S3mhWo06jKDl+5KjG38hnEOnx1DeFlOpmAs/w/9jVJxa1i
	ve2Ut5WMUBNjTwQr1ZYWIo/QJIwcjdwVa0Yu8JpKRuVn9PQZE760wAaK6MaJdWBhJsKT2A3rNRa
	Xh/BQZ2FpX+Y5wjdBKOshM2tNlWJaJAQxlkJuI0E/XGJHJ/CEWoVyYxnU/EwuMRRHFZghALO47I
	sIw61B4TtTwsiYizqdNyL849/XOxWr01ULVUwDGQS/YmLtnVZ4HQWHU6MEBzSwX72X59sOtHp6z
	Ys/ZOcd5HVouPQ1NU4V2d9LlbVELRoCuXjrPVpDLZ/k4PyVCkKMmA0dLVgqGaeIDhc1lwYDihYt
	wgG2/ErKChM5ms=
X-Received: by 2002:a05:622a:148c:b0:4e8:b446:c01b with SMTP id d75a77b69052e-508db3c3e38mr51561231cf.61.1772668283201;
        Wed, 04 Mar 2026 15:51:23 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-507449add38sm166381371cf.13.2026.03.04.15.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 15:51:21 -0800 (PST)
Date: Wed, 4 Mar 2026 18:52:02 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sdm670: add lpi pinctrl
Message-ID: <aajFohvO4En-U17W@rdacayan>
References: <20260210021109.11906-1-mailingradian@gmail.com>
 <20260210021109.11906-4-mailingradian@gmail.com>
 <2b3d9528-56d0-407f-bd3f-e805cfdea5e3@kernel.org>
 <aYvMCCWxVPXQeRCZ@rdacayan>
 <3698abdd-e864-47f1-8041-fb129389d90c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3698abdd-e864-47f1-8041-fb129389d90c@oss.qualcomm.com>
X-Rspamd-Queue-Id: 5AC902092B8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32522-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 10:08:39AM +0100, Konrad Dybcio wrote:
> On 2/11/26 1:23 AM, Richard Acayan wrote:
> > On Tue, Feb 10, 2026 at 08:42:59AM +0100, Krzysztof Kozlowski wrote:
> >> On 10/02/2026 03:11, Richard Acayan wrote:
> >>> +		lpi_tlmm: pinctrl@62b40000 {
> >>> +			compatible = "qcom,sdm670-lpass-lpi-pinctrl";
> >>> +			reg = <0 0x62b40000 0 0x20000>;
> >>> +			gpio-controller;
> >>> +			#gpio-cells = <2>;
> >>> +			gpio-ranges = <&lpi_tlmm 0 0 32>;
> >>> +			status = "disabled";
> >>
> >> Why is this disabled? We disable blocks needing external resources or
> >> being busses/connectors. This is not the case.
> > 
> > There are reserved GPIOs on the Pixel 3a. Since commit 4f0d22ec60ce
> > ("pinctrl: lpass-lpi: implement .get_direction() for the GPIO driver"),
> > this can't be probed when the reserved GPIOs are unspecified.
> 
> Are all of them reserved?
> 
> Does gpio-reserved-ranges help?

Yes. It would need changes in dt-bindings and in sdm670-google-common.dtsi
(introducing a dependency on Pixel 3a XL support).

