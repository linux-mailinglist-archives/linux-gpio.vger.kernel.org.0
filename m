Return-Path: <linux-gpio+bounces-35369-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yC+LHR4W6Wk8UQIAu9opvQ
	(envelope-from <linux-gpio+bounces-35369-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 20:40:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D79C8449CE4
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 20:40:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EAE1F300FB7D
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 18:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 494EA3C5540;
	Wed, 22 Apr 2026 18:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hqWJg5M/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y5w7LUQ6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E9135DA5B
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 18:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776883166; cv=none; b=juyBDwLf6Pu8QFEtcHK4zKcYP1MgminOeZ7Ut4Mr9KRR5P+I+dseaO4Dcwwk169hcaX8wkKFE3Yt9ftKg3G4mTxP10w0q1f214JPN1vOMIfKDFvazJjk3/FmLzjBrTzeV9anQYt0D35s7sdC2cfdY4kAQJt/EKKJhHwQk/KzAa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776883166; c=relaxed/simple;
	bh=Byw3HEJI3dZ1MQ7hAoE4nHm94wBBnYmzNPkcwewTFOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NnzLuP0nnzSYoKlkVAFgo5l0ZdtmP/mV+b78ZSFxTq2MRkT3njNdpbwjmfaNDKeGEHhiWgujZCQktqMLOejPQmzUJb6bMoF0tGG83k2r7aOEfSqS5TXk5jEwu20vxSkQ577+08DlWDMOhL8duyhXyhhxwAfWWEw1fvoGiMcHmag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hqWJg5M/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y5w7LUQ6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MHuHhT2631268
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 18:39:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m2/vpE66mfP4uz2lk0mlRo3rInfiNHI7eH+lPLc4PcM=; b=hqWJg5M/6x/mZMxg
	7SfUXFlyQ0G0yDUtaUTFyiAdF32HQEy8l4vWAQjMhzkY4/qxfiu21cT0xJFAVLoD
	t4WBzmefAxtL2XuqPXOe3lEIuaqoGyrkXbj50cdYI9JWuZnAfPhpkoRs1D7ZDm/K
	c9z6k0s2akjJFRTxtQp3mzONWUzd3/Ly/g+F2KZNmVwy5PBOEiYeR/cNZIgKpDM6
	vrAY+VvzftcJnqBDP7Tl5vhD1k275VphLgdHBr1sMl+ZFKyZQhrK5buAwJS+prAG
	OZ+ywHew/K/w0H0pR2H1WC8gy4LNJf0TiRAZ+I+3vuAzZdme3OdOKOcKVsdaDg4k
	zc1uBA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq35r84tb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 18:39:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fbc49bef6so32653521cf.0
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 11:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776883163; x=1777487963; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m2/vpE66mfP4uz2lk0mlRo3rInfiNHI7eH+lPLc4PcM=;
        b=Y5w7LUQ6zTI/swczFWazwCK+rit/LahYEGmh22BReHe2PSQGR4co3cUIpWiLY9RaNI
         nzCQVRtCdurcwX26CMjuwEQ4rPuNky0cABQhhiEKmKgyT+ja7faaCv24xdtcG/1HLKm0
         yjuIArSpqTj4trvoSHrH9iPCdp7oM60MzbEbwDxc4/lCm/R0Ql6lrsVcIXAKA7lLYTdE
         BdP0qopPUCVQG/lzuIlaVByZJqm/0iMpByJzaXjmiuInguWlnh5E8BBuON1sr8xAEN+I
         STeItd08G+jyEfQ/H+aHiAWkH2lw7a52n/W6BMJrOnR/Dulhwf5RQAGmt9/ujt516HBo
         lBZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776883163; x=1777487963;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m2/vpE66mfP4uz2lk0mlRo3rInfiNHI7eH+lPLc4PcM=;
        b=p+XEW7CdJYmS2OspnOdWUrtiMqHITduA+aLRLA3oPPcu0UxvhVQVu0Is6Zg97ZyzP3
         HYe8UsqGFdJxyj7rdcYFb1ZwjeRAhR4dU7UKN1RUaJ9Vkj2UMGsq2pe17eRWrBeLRFg4
         xuPFbdfLqQEygJ1za21bO1tiih6NifHrLXb1E/2kTIfmpgG1IiL8OThgQVF3BUjddj+R
         38lMM15AUqQDY/3G35R70eIByOnFP9uQ7cwiaSToomcF1SAjvdK31Rv622dFLnY2tLEt
         Fh6yPuLPYrlEY0E9LmJjjqrUGj8F6rfdykBR5tzmh1EkFVuXKwzDdEe4a++IJaKFsw1m
         nmVg==
X-Forwarded-Encrypted: i=1; AFNElJ+RlbdEF4cHGOsm/1W1buv0bmj1bdo/VKy2cbN5CtB5w+Q1764ENV7kTow0jPr1MIQhsdJe3uQj0YNm@vger.kernel.org
X-Gm-Message-State: AOJu0YxWfPUdSj/PCJBUqfWIIxeyM93Q03qy1bugIGHDxmXFnRy8UdGh
	D3ItTaf8WZCMoBYMJcDAORuOq18Hot41tynSOGlKSQMZmVQNFYi4VzJDobATD8F+A/0G+Gosp+b
	qy3RU5nRBrhcNevv20TtsdhbClPNTOD2aVJs4Mk7rD35UQiaBTamCfTyHXzlrVaRo
X-Gm-Gg: AeBDievlblad3OrvXXcVMQEyZDh1a6xSM2OIz5l4T3ioxAfUPiTv8KcKvUdbaF5bdph
	P+2X/72oPVJeNURLAC2XQdxgkonS5oJXxK8LXh9ougxpJW2Eab3Pr37K3iEYhhrbQFW2An5M93w
	xv7GxOzFqzYEYZLI7Eo9YWxekezjimXSL7F/s3Hjg2Gn++lWKD7TGWHs+mXQ2R6FntiKel9i+Hl
	cY9P2CnjI7yZmcQF7dDaVDIMa5Th9nvNeVBhUMpZGAjrA3h9HuJ4UPhKnA5HQB5nMlWNwXSyc/k
	trjB/rgcJlXO3BTkPMGMfEZaawxhhTr1Gn1s9Ucf4LOr2BTVV5VDGzlFBLUu3q2dmgQNukJv1BT
	/6QE01sMI6nP7cGkmw9ODRsc49h8SrBGfGm53F4NnJuL4jxx514jJDMLtAa/Ca9cOjaAZZgD4fe
	k8FrazLh0oDpA3ts2w+PEQiYRN9TM4Spe4hS0yY8Qsk0sITQ==
X-Received: by 2002:ac8:5a90:0:b0:50f:b2e4:ec8 with SMTP id d75a77b69052e-50fb2e4127bmr129767401cf.7.1776883163082;
        Wed, 22 Apr 2026 11:39:23 -0700 (PDT)
X-Received: by 2002:ac8:5a90:0:b0:50f:b2e4:ec8 with SMTP id d75a77b69052e-50fb2e4127bmr129766761cf.7.1776883162609;
        Wed, 22 Apr 2026 11:39:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ebe3dsm4571337e87.74.2026.04.22.11.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 11:39:21 -0700 (PDT)
Date: Wed, 22 Apr 2026 21:39:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
        Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jagan Teki <jagan@edgeble.ai>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Riccardo Mereu <r.mereu@arduino.cc>
Subject: Re: [PATCH v2 21/21] gpio: add GPIO controller found on Waveshare
 DSI TOUCH panels
Message-ID: <dovqowg4a3aet2f4gwd5lufh6xqopeq5slgyix2bqbf3v7z4fk@b6pwiyn6ppov>
References: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com>
 <20260411-waveshare-dsi-touch-v2-21-75cdbeac5156@oss.qualcomm.com>
 <CAD++jL=zmd8yto9HuyjC8cmBj1oMgOa7C899yo_toP9Q+QJcDw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jL=zmd8yto9HuyjC8cmBj1oMgOa7C899yo_toP9Q+QJcDw@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE4MCBTYWx0ZWRfXyXNZflKfvTKZ
 Ld7ytxSakL5lipQNcRtGJ8qxfCqcpe2ZcqInM3KKHDE3gQ7CMC4EA/fOWvSp8dRHLFjr897zDQk
 BpCYVkNRAe8d9Tqo5XxMA3m2rV4AMoM09tCXNV4ptDDK6ZC87dp/8fzgZhbm4qPWQD0DBqE1F54
 dra2Njz0IwongdqaW2LDHunkOASpxJ7iFVG3Wqw8CLxK0uZsVYTbOwiy9xFyaWXbjGXj1aVkJ1f
 NuGpktg1C1SC2kSRd1CNHyr6xYfO+eQiuwF4T+h1m2H6CTDodC9WsH1zz9bUq6KkHMpx2ZrXG9L
 RVURDBB4UXXu0dT4mUQNrGLWKkLYGI5IDHQNzBnjjm2egJShohEWUUxPK4OwWtbUafdpDUefRi1
 605C4JpixJx7LzTI6FAmM2YjvOUdA1CNjH2JF7dkFZ73hWNqMAJVGEt9d9Db6f9/ybrJleWfcVc
 NRyc4Sd/go0s7ww8NGA==
X-Proofpoint-ORIG-GUID: QEbe6SR15DO0wRHDojFcTni5MZBrQL4m
X-Proofpoint-GUID: QEbe6SR15DO0wRHDojFcTni5MZBrQL4m
X-Authority-Analysis: v=2.4 cv=f5J4wuyM c=1 sm=1 tr=0 ts=69e915db cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=7GRFYvq2Tdryq9sLJf8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220180
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35369-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai,lists.freedesktop.org,vger.kernel.org,arduino.cc];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,arduino.cc:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D79C8449CE4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 03:20:26PM +0200, Linus Walleij wrote:
> Hi Dmitry,
> 
> On Sat, Apr 11, 2026 at 2:11 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> 
> > The Waveshare DSI TOUCH family of panels has separate on-board GPIO
> > controller, which controls power supplies to the panel and the touch
> > screen and provides reset pins for both the panel and the touchscreen.
> > Also it provides a simple PWM controller for panel backlight. Add
> > support for this GPIO controller.
> >
> > Tested-by: Riccardo Mereu <r.mereu@arduino.cc>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> (...)
> 
> > +static int waveshare_gpio_get(struct waveshare_gpio *state, unsigned int offset)
> > +{
> > +       u16 pwr_state;
> > +
> > +       guard(mutex)(&state->pwr_lock);
> > +       pwr_state = state->poweron_state & BIT(offset);
> 
> Why is this not just flagging the same register as write-only
> in the regmap and just re-reading that same register from the
> regmap cache?
> 
> > +
> > +       return !!pwr_state;
> > +}
> 
> OK so it's write-only.
> 
> > +static int waveshare_gpio_set(struct waveshare_gpio *state, unsigned int offset, int value)
> 
> This looks like it can be replaced with a few lines of
> select GPIO_REGMAP
> #include <linux/gpio/regmap.h>
> helpers.
> 
> Has this not been discussed earlier?

Yes, it was. Using gpio-regmap would complicate BL code since it
wouldn't be easy to directly toggle the BL GPIO.

> 
> Yours,
> Linus Walleij

-- 
With best wishes
Dmitry

