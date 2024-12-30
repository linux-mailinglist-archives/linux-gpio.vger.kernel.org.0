Return-Path: <linux-gpio+bounces-14344-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE999FE355
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Dec 2024 08:35:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DF883A1D49
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Dec 2024 07:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B26319F495;
	Mon, 30 Dec 2024 07:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N88VfJLN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334C019F416
	for <linux-gpio@vger.kernel.org>; Mon, 30 Dec 2024 07:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735544128; cv=none; b=YuMO+MqnWLCTWuVjQX2lE6AUfYb7I0GX4awZDdBCk5j0JcOk7te36rYaVsRfdfr+4u5OH2GMyN/fAFRT+1y9MHBjO0GNN8CJVTefN1HSGNsCp6clmEPtnHPhW8Jm9jWQhM5/ksBlLbi9iPByn1yYw+QIUXSAuXjYoUde/ZsG8dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735544128; c=relaxed/simple;
	bh=Br4u/1H4F+z6jRFxzt/lauVDqQKVMS5Ip7fQqnYdgxo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y3Ma+v16gUEey6UL3abLJ3ngkNq643U0YSq3mu6Twwjbrec+wC+TPtfnaj6TyqKKoLo/YVNTXPUucqYK0T+W437bqoRZVONJLW60F82AovFg3lA+AOTfKZUB4aI0gKZd3cwF2oFJQyMSE1nA0D+RjmC0T2NdvTEYAtnfssJjViI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N88VfJLN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BTNSuIE017325
	for <linux-gpio@vger.kernel.org>; Mon, 30 Dec 2024 07:35:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Br4u/1H4F+z6jRFxzt/lauVDqQKVMS5Ip7fQqnYdgxo=; b=N88VfJLNvYIAMwAD
	KYduge8UiIBceBedr7BtmUuXEblYu5iugOd5HcEGVo4of6sa08ygsUA4uqfReSQR
	E2zRrmVtqQC0LmPx+S+aepYwf9muiiErDTO1qNrL1abaFKVONtcJKoAo87RP/WTN
	1DE+aP0TdxCM//d3oMOzsN53QV8FP9dBXIIxM6GhL9j8XkiHa55aFUXAfC9/m5rv
	cAm46VJuhINyqBO+6WmpvRQvHSsOlq1sNJbUPySp85u2duUac8thwkCAk1K9X8Am
	lDfLzplzNDLWxLUvrfXCbyg4yXjzjcK7nnjUzznP9t7tkjYyczVwN6uHEtdoN1bX
	H6va+A==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43u6u2hbje-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 30 Dec 2024 07:35:25 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-2a3b2770597so7298027fac.0
        for <linux-gpio@vger.kernel.org>; Sun, 29 Dec 2024 23:35:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735544124; x=1736148924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Br4u/1H4F+z6jRFxzt/lauVDqQKVMS5Ip7fQqnYdgxo=;
        b=GUN9jpG4LEicVE+qIWqzZ8ykkMZjZzcau508jwk/mWsMyMeC3wCF6s+wiFf6fCuvbi
         wZJjCOcIc7NLo2oq3kvFlSr/7uROxvWx0lioMnHxNwlnnVtHM10VmpQgmZIvwNaWVTPo
         r1XL1mcgTZByhlOlcTnCzVfuBwkOglrLHYA3S01hAj4r570mmZJoG3F4gJs7vW52SKDc
         Y8v6rQgT2P9BUhnGthNMTO6yq/pfCQlvy+ihUDZvYa+7iNQxZvokQAeylEk5hHtc2RxN
         kjYd7iQqmnvqH7oeQvtfWbxEyiVW3ymUMHESvLWe0PoDC7i8v6McVWtYqYmslnVakIHB
         zYBA==
X-Gm-Message-State: AOJu0YwFuYfOgT1EJBGCZ2moEVsc1AEfwkgsU8xzeV9bwoHfhwPhJovm
	Fqz2v3o1zZtP07hxXXW9Hw42M2i+u17viGlWSNoU4xTePQjQ3T5yaZ09NjU25oNp3B4brozo9pG
	dys++SHHwUZUwX7uZKn8Pe5biQBTd2KeyKaR8bQXMLMLMBzxYmwtJDW+dsU/3V4AbwwZ1qi4Uou
	ziaNZ2Jjn5pcm3uWfl9g77zlJVXubaEpvMZusxASboUleOBQ==
X-Gm-Gg: ASbGncus4CksOM9bCXUFdzY7BB4UA69SY1kUNT8S3PgPkRkzlWKUgwKPjOpdgIti/Tx
	CP1Ly/Tn00sFbO9s1XEDAUTFOxDazee8oMsXBwUo=
X-Received: by 2002:a05:6870:6986:b0:297:241b:c48 with SMTP id 586e51a60fabf-2a7fb3a528amr17253024fac.40.1735544124595;
        Sun, 29 Dec 2024 23:35:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFVewqrrt9hycM7limjI0I4DjRybfEEeEEiP7GPRWk9/5ULMfDq+INTmF+skd50P84lDxqZDX2UyZaSm3GynWg=
X-Received: by 2002:a05:6870:6986:b0:297:241b:c48 with SMTP id
 586e51a60fabf-2a7fb3a528amr17253021fac.40.1735544124248; Sun, 29 Dec 2024
 23:35:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241224084441.515870-1-mukesh.ojha@oss.qualcomm.com> <CACRpkda2ejW2HoOr3rTRrx7CK6qyoV--S8dRJ9sem6CcGejY6Q@mail.gmail.com>
In-Reply-To: <CACRpkda2ejW2HoOr3rTRrx7CK6qyoV--S8dRJ9sem6CcGejY6Q@mail.gmail.com>
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Mon, 30 Dec 2024 13:05:13 +0530
Message-ID: <CAN3W6UX0xEirheAZH2VS0y133i6nfH4vM72wVD5xcO=3CrCCrA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Fix the clean up on pinconf_apply_setting failure
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: apYieo7S-UjVB2MrlN8yrtgOVTjKkDha
X-Proofpoint-ORIG-GUID: apYieo7S-UjVB2MrlN8yrtgOVTjKkDha
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=941 suspectscore=0 phishscore=0 priorityscore=1501 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412300063

On Fri, Dec 27, 2024 at 9:40=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> Hi Mukesh,
>
> thanks for your patch!
>
> On Tue, Dec 24, 2024 at 9:45=E2=80=AFAM Mukesh Ojha
> <mukesh.ojha@oss.qualcomm.com> wrote:
>
> > When some client does devm_pinctrl_get() followed by
> > pinctrl_select_state() that does pinmux first successfully and later
> > during config setting it sets the wrong drive strenght to the pin due t=
o
> > which pinconf_apply_setting fails. Currently, on failure during config
> > setting is implemented as if pinmux has failed for one of the pin but
> > that does not seem right and need to undo the pinmux for all the pin if
> > config setting fails.
> >
> > Current commit does a bit refactor to reuse the code and tries to clean
> > up mux setting on config setting failure.
> >
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>
> Hats off, it's a real nice patch. I bet these are design flaws from
> my initial implementation ~13 years ago.
>
> I have applied it for -next (v6.14) while we test it in linux-next and
> think about if we should even back-port this to stable.

Thanks, Let me know if you want me to send another version with tagging
it stable and Fixes tag.

-Mukesh

>
> Yours,
> Linus Walleij

