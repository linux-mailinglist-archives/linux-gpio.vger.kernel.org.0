Return-Path: <linux-gpio+bounces-35074-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4dYLCzQ/3GnkOQkAu9opvQ
	(envelope-from <linux-gpio+bounces-35074-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 02:56:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 719D93E6878
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 02:56:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC291300D45B
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 00:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC157212554;
	Mon, 13 Apr 2026 00:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ouj5s11M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NCMWYILU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F0F1D7995
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 00:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776041776; cv=none; b=W8/hyL8zrZOCfdaq0j29QU+IGY8dmhvhlDCr4HRBA9DLxpYu/AJ4/lrdQEm+M0NGZK+crPluZsm1hhfADTv4Gs8dGcd8flVTSahblnRafj2aeB6RX54P/j8pQGxVfQh8ss2X2+LNXD5H9GklU6j5m9eosa7Aj8VJBoR0xLf4V5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776041776; c=relaxed/simple;
	bh=V5ifw+ouAt9/h76UJRk28uWOsbTjGziQXpcaQNQUtmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Go15yhYxzLi1BDMCLCroOn4BcMgYgS8rjRC6CEeCfB90eU5XIfTmTLvAHWl2pVal5xNoFl9LVG0/+i5I3kf83Fbn6rV1Q6BJdwURQ0VuzDKGIpgpS57UUT0OfSpzogFtedKOmvl1R/iAU6gYf+A1IqwtXPLXrFEZOU8FQerU9+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ouj5s11M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NCMWYILU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CMuRQU557577
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 00:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HijQAzOwombW0sXEz2D/Ph1M
	agV/nyykDUHyc/yg8Tk=; b=Ouj5s11Mh1U09Z/e3VoJZM+qKJ5LCf0cZdXI/iio
	4fLEtDaRgbRAf+a4WkNBJV7KUrGL16XzNJt8/ynV6mCkj25Ba+W6Z44NufE5nRKM
	IbbrHcomYp9PchajxCDdn8ufUTgvbhi8lcJykAlPrA2Yxc38rHYDM3wD5AiHwgfR
	16vXbBfPWi7Hsfaa0Ukx7zi0/kflDeOqI9brP2N/1EfG8WhXnJJZ/W97MRiIhi1a
	bvBTk8WSRTRzn2WG/xdeG0vhAwpWcckaw02mIQr/BBwgbFYUnphpcniqU1Me+FCV
	zwBFkpDT/uy80zo+mO7PNv4HuI8vdDJtMqtGNl7KmtKMJw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfffhu6fv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 00:56:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8e8c47a3so49108341cf.0
        for <linux-gpio@vger.kernel.org>; Sun, 12 Apr 2026 17:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776041773; x=1776646573; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HijQAzOwombW0sXEz2D/Ph1MagV/nyykDUHyc/yg8Tk=;
        b=NCMWYILUE5dAv2kojVA78EISavcW/IYYG4+/mVOuvFOJ9k9Q4oUpVjopwENfyn3MTo
         El0i+PILbD9mftc/LjgtjBwSVdS6Asng+q1TQnSyrBgALCUJdIhnm9gHQ1zY4xq7qSih
         vGRmaCSQfqxDP7MwNmCB7CVX7dRVOakYF0HJZgBl/WsxOULBUpIWDQEsfUTlvlwPEfhl
         dp734nuusN5sUysOk3fTt+V3raeKmkgnRNkQ99dnwa5I0Nj0h9KBKVP9DWJ+hf8ojC67
         lf89nP2+h9/MKq0b+vEbbrzVwKCVsE8Q+QuNrYMw0H49rXK70jh9CR8x+0Qqo20c1Gic
         xDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776041773; x=1776646573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HijQAzOwombW0sXEz2D/Ph1MagV/nyykDUHyc/yg8Tk=;
        b=ico3MTPBGUAT6fxe2wTnf0scXxlNok8HEpXGwYGILHRHkcRSoSs4C1w1GWakjB4Io0
         tdJYNK4gmyWNKfcZwmCiqnt3s9rVMl7zltTvuD5vE+9V3qj9yOb0eYIpbaORLZ3ksfhZ
         dFgXOAiEQDEwWjLind2B3V9XANamorXcYiJxs4wLsu4SAeyu9jOqYd/wyN1AIn8q7Za2
         5bEGmpABmg5ML6T50AEuv+NQPzndaNs3ykgIlz5M/U+/8KC0Ip+1Bc6HSi5HI+tGq63B
         4/ZZYKMLoznlC1tOuR1z3DA6bstFsZyYyJ8Lv0ZEOnxWUNH/BafNzad0rj7OSPsYSSvf
         zLMw==
X-Forwarded-Encrypted: i=1; AJvYcCXN5Hr97VSuK7HaHJs819bB6HOua1WAKNRgINPNPz2NS7KtgrqeGbLClprF6UfhKfol1ypFOOFeyEHS@vger.kernel.org
X-Gm-Message-State: AOJu0YwUxeVgr+FLa176Z6GKmpK50STXRzToYxgpkIyYHflN0SD2Vl+/
	CIWiPiLFngYELzdzVCB2tMqfi4pkwOjZxxDXQMsInNsKDggJO6G0bQG6oigqWEQca2PEAiygh8P
	h2/IOKSGORAwi+xyNXdm/uBmoYjSUjhWQgmlkJHSl7R5Rsdz8GXkpn6stvjmF/T6P
X-Gm-Gg: AeBDietKZ8q9Hr45A81mBP5VrcreBgb9o78QOL0gMCX12fU5mqY4z3j2/dQK9UDnZxR
	jRZTo4wIYW+KmeCW1diq9S4//TcNH04vQBiSm7NpGDmEwq7ylfVeSUU4Adjq2M9KAu2hOLFQFtX
	QKsryYFT1KVkC2DFBdh6Fu2R1QVuA7axds4hM8cAo9Rwjy1E6DrK5c8JBy1+4LnnlSFrj9wCJ72
	43zzZiiSt9DgdYPqYXEux4SwxHXZhnt8uWxXCA1/JQZpj6cjVouOZFJnp1eonwNBLhBluGs9/d9
	lMEuMooCRmYAz31Tewmb2WIgMTGhdtFtF7OtxZO9aQ+DveDxxa4dquXtTIWvo/sTdVkkALQuqlZ
	mYFQES5jwo7P0g1S2/MKQvyn5pcyyU2hwXOKnn8teSBc7umPzH3E8jwpp/Go5Q+QYwP/+waKxCw
	vKm2to/nF0mtBEoTTuFYC8FKIyAcE6/hO6cdE=
X-Received: by 2002:ac8:5a92:0:b0:50d:a637:6bdc with SMTP id d75a77b69052e-50dd5bcef84mr180329251cf.41.1776041773604;
        Sun, 12 Apr 2026 17:56:13 -0700 (PDT)
X-Received: by 2002:ac8:5a92:0:b0:50d:a637:6bdc with SMTP id d75a77b69052e-50dd5bcef84mr180328931cf.41.1776041773128;
        Sun, 12 Apr 2026 17:56:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e49541ddfsm23293661fa.27.2026.04.12.17.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 17:56:12 -0700 (PDT)
Date: Mon, 13 Apr 2026 03:56:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
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
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Riccardo Mereu <r.mereu@arduino.cc>
Subject: Re: [PATCH v2 20/21] dt-bindings: gpio: describe Waveshare GPIO
 controller
Message-ID: <mzuwcmkg6u3l3b36wiemdliq7fjrmu3hx6bxba4k6nyhfffibs@a7qh6wcivc5v>
References: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com>
 <20260411-waveshare-dsi-touch-v2-20-75cdbeac5156@oss.qualcomm.com>
 <20260412-diligent-ginger-flamingo-f5059d@quoll>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412-diligent-ginger-flamingo-f5059d@quoll>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDAwNiBTYWx0ZWRfXwsLe/GDAcTW2
 IYcc8Npi2EF0kiVZ5KczZuP+XAYjoNOQkPkHrd+eQ6SMn5zF+E9n6ujpX+iZPtZnxUQ8GCjflAt
 +XhT+mblbdRvnqH8+FGd+i4joI4qHIKUeB2xIK32v3LaICg3/rp1BpQ7QPleYQw81q2V+iLeOIi
 oMfLTY45hEpHQbNjP2oxoBxn/Ci4E3HZ3+pvNPeiifpiioVfo2C5PTvKK1IPaq0s2/5Vwl5IEmA
 rcyXGiqw1NjSDZbCLleojx0DRdBgQXxoWFurK9v0w/voOXY5CcwVXHyLi2s4VtcqKEOmNNDBHzm
 ePRa5rA2s2x5ny+e8uwyIabIZU9BKFXSfQMnvYNHPKzPh1xshS4z5aN8GNTI8UX9WE5TTOpVpQy
 TfAx2mBM51R035LdiPjod8Xzr4k9j8qbb4g7nKwy9SoNHhn8eIcm7yEbpk/2yluSonWQqjwu6Bi
 5j8EOCFjzQ6D4ngyHng==
X-Proofpoint-ORIG-GUID: qp3KDK5X6DYp9-ZnCtA4CiL-Libq_lzY
X-Authority-Analysis: v=2.4 cv=FOkrAeos c=1 sm=1 tr=0 ts=69dc3f2e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=7GRFYvq2Tdryq9sLJf8A:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: qp3KDK5X6DYp9-ZnCtA4CiL-Libq_lzY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_06,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130006
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35074-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai,lists.freedesktop.org,vger.kernel.org,arduino.cc];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arduino.cc:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 719D93E6878
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 12, 2026 at 11:48:46AM +0200, Krzysztof Kozlowski wrote:
> On Sat, Apr 11, 2026 at 03:10:40PM +0300, Dmitry Baryshkov wrote:
> > The Waveshare DSI TOUCH family of panels has separate on-board GPIO
> > controller, which controls power supplies to the panel and the touch
> > screen and provides reset pins for both the panel and the touchscreen.
> > Also it provides a simple PWM controller for panel backlight.
> > 
> > Add bindings for these GPIO controllers. As overall integration might be
> > not very obvious (and it differs significantly from the bindings used by
> > the original drivers), provide complete example with the on-board
> > regulators and the DSI panel.
> > 
> > Tested-by: Riccardo Mereu <r.mereu@arduino.cc>
> 
> You cannot test a binding, it is not possible. Otherwise explain me how
> did you copy it to the device and what sort of device runs YAML.

I'll drop it from the next iteration.

> 
> The tag was given here explicitly, so I really do not understand this. I
> could imagine tags coming from a reply to the cover letter, but adding
> tag here? That's just fake test.
> 
> Best regards,
> Krzysztof
> 

-- 
With best wishes
Dmitry

