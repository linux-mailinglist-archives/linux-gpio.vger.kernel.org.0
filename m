Return-Path: <linux-gpio+bounces-34905-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CbLAdfz1mm2KAgAu9opvQ
	(envelope-from <linux-gpio+bounces-34905-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 02:33:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1A13C50B3
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 02:33:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A58E5302F725
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2026 00:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3338125F98B;
	Thu,  9 Apr 2026 00:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U0SCwCZX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i8ngqrOu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E7C1DD525
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 00:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775694794; cv=none; b=VdtYOmWnTFYqEsPqRH/o9rBS8c2xfdcjGds1w1E4JF42ag5TfsQL/e1WZOj1IrHTLSlsLYaufSeD6cmpeaFpFU237xw12ytyXWrUafPS7ckFrEdnwv6TmDf9ZvOfAaIDxon6VPjNvKbJmYplYQ8sEI633/srv4wtmwW0njczZLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775694794; c=relaxed/simple;
	bh=A8ButF/p6fdC2H7a1NdKyYUkorvb3n2bFFz9qjWRh+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HPmKwUHT7YuhN87Ph7tFq6Czcu5AM+IoLU9X3hvDRqmpvvVvd1M+91pI043xs1pWXXd2JqJwT4jZha+opXrFduULaLkSQ3Zk9aJKr+ugx/FgJILPfjr8GzrKmAMiHNGjrtsx+R4RJN+y4Phohx6wle5gCTfvFLxOtp4DoREwoWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U0SCwCZX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i8ngqrOu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638NF5WG2845008
	for <linux-gpio@vger.kernel.org>; Thu, 9 Apr 2026 00:33:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VPebicgWeW163zCIOfHExmD6azJCLCKyS+x3r/GXDMs=; b=U0SCwCZX3X+QreX9
	INbBys5rUwg4oR4+lxiJ0/igdZze1ifAZ31n4ckjOaqtp4PddKYI0NqBsoo6Slzr
	BLu+rfuircUxWKya33zjFb4xxCJYdat8hZ/pEDp4LlW/tzPR5CBo+pYnNu9hpkEZ
	Jp+3dUcS4gepNuPz11Sui0I/9Dg6mBmxLUa+1r9KixFd43258J3AcbKqC/3Pj01y
	xJk7eZdDCFnqA7IarC4Og7y6T0oSh7fgkqRTjz0GeTFp80sV4hUHuW8bqOXDi9tZ
	RjasNPCPjBWJIanc0RLrlq1mRPczMnUaZ7WL32It23eqLUzfp3NNusw5NUaK1omr
	Yp6mpA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt7hhqth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 09 Apr 2026 00:33:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d9d52ad9aso10189501cf.0
        for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2026 17:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775694791; x=1776299591; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VPebicgWeW163zCIOfHExmD6azJCLCKyS+x3r/GXDMs=;
        b=i8ngqrOuPsF478PUL/XIMkS6DrQEVaKOaqErk5nt+MvfuTZtTlU8njVyCFJrIhgP56
         bNHSEGvJKd4bH6+0RwfOPMmfsQIrI4volbIE7kOfaZpfDy8dCoUrNYJiNxda6nm5Ivkd
         v6M5AOhRlXwv6iabexF0YQQLXZhQrXmXJuXcI70q2fCTV0QhNsQba3cF5KNoF68gbAbV
         lhMCNjG6Nqa3QwmmOn4a66rrn6CnPSzeeYLRAZeh8kl91IP09UFjZcUxBEPsMPuYXOE5
         Wp51zWcvht42a+X1hAHaUUrQJE39/iROolKRw17pLnFyFLlUCtYEKz8r2XPCgZVEnb3O
         9nnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775694791; x=1776299591;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VPebicgWeW163zCIOfHExmD6azJCLCKyS+x3r/GXDMs=;
        b=o8T8zfz2dj2R5qM8qCE/BAMeMzBkrFcuQ3Wfx2B4g1RE/4GmKEwkerEPmbXlX6xkwF
         5NFN7uA+TvCP7fDT1uP9CFM6okfGxXm3vQFTIXWZ8df5OxZKCjTwrzRrfJZh7GimXmkD
         atQhgCL6JYLUsSJtQjKHzcgz45qIJsiQCGkNntDFcqi8jKc9x1C61dMJRSFc/as/bSBj
         bRvojFJWjhXKWis2l72ocZOx+n+Si2Q0yJraHUHxfsA/ahdtSDLHUF1ElJkDoGFE1/kc
         yIr8xC5lS7Vd8qKqC7jLyBgth50E71uwHAEKQk8WfCnfZ8FvtK0VpqFLFXhF2P1cFxo4
         LuvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEZnw1kMd750bX2XI0hYOy/0ASkX0qeRfNTJ3qytMiOI8ZWIdE4q9RuHrQhd1ybbe0wjNdL+uOEKG8@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmgr5p8TRyGrTBPu00XejE3MaZoEZ0CLvoTjtuWJL13+bek/WC
	X/UCg4fyrgLAoj5EogX2fPfVfrQKdjgdkQzpVtzS9ydwe6M9rNsEuNfj2pDQZK0cd7TfCqOjXNk
	t1ubZzu2ngfLKkYyeshhqW5wiTgbEf3pgEUrDlfoqxeAn7ZyU7sd7gEbOakeyMXs1
X-Gm-Gg: AeBDietszyxMj63e8Sg7jGxg9UHaM99ZxIdpZrjoPCoV5MgdUo0E6REGnbshfdFvjRx
	Nt94Nnnnsv8Ry4V++W7HqkDuKGB74hvqQlcpVftOX2wGhocL2mp3rYMUeorJWEu6aHgkDQRloe/
	4/9fOLkgMrMoV54L6BbF99q4g1eZ/mmJy/Q7oJS4ENpx/eros59SDXzrsd+qUaTAkRIwYhcIDO3
	QkPnGIRiOwhJMa3EYfaUx2m67h/Xs6TyiI2lBC2YU3HWz/6w9begz+D621Yh3JyuWzJT8Zrez1R
	DTcY4JFUTWz0qWIDbMiblpOfPTk1zqGhoOdVo5lgrrULgqe3Cx7yLAERDmNSmrMSWhnBuyo/ENo
	vOk2YPse1N6jbeWwgmakUOxieEOf5x4cfTgjWELkXbEWyIXWXWXno1V+7COb8qQGobFp4PncKaV
	71nH9AcEYtZD4l6KqOGofEdozzuLX5vu0y8hk=
X-Received: by 2002:a05:622a:208:b0:50d:857d:7ad5 with SMTP id d75a77b69052e-50d857d7d33mr242507741cf.59.1775694791172;
        Wed, 08 Apr 2026 17:33:11 -0700 (PDT)
X-Received: by 2002:a05:622a:208:b0:50d:857d:7ad5 with SMTP id d75a77b69052e-50d857d7d33mr242507291cf.59.1775694790651;
        Wed, 08 Apr 2026 17:33:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cd3698sm5136232e87.77.2026.04.08.17.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 17:33:08 -0700 (PDT)
Date: Thu, 9 Apr 2026 03:33:05 +0300
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
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 10/19] drm/panel: himax-hx8394: support Waveshare DSI
 panels
Message-ID: <fc5iilgkotgp62aq455qblguh2ktpgqpjl72wxh5oydl4bnkv4@ph65twdn2566>
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
 <20260401-waveshare-dsi-touch-v1-10-5e9119b5a014@oss.qualcomm.com>
 <CAD++jLmG_y2dunkyzH7KDtphN6WORzt87f5CpqzAtCUtALv8CA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLmG_y2dunkyzH7KDtphN6WORzt87f5CpqzAtCUtALv8CA@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=O5IJeh9W c=1 sm=1 tr=0 ts=69d6f3c7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=UUk_dXEGBgzJ8t3P0IwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: H_yT8PRRlzBN-atCZ91UslKXSraykZqT
X-Proofpoint-GUID: H_yT8PRRlzBN-atCZ91UslKXSraykZqT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDAwMyBTYWx0ZWRfX+EaR+Klvo6/K
 IEZarkvnCHnywy8J16+OosPD6cPUACHApJhfvYxPgt187PGTnbQAJTnTuyVtv1aBDv84BySxy00
 0pvzlkmnMdW/GK13U03U8zh+utfFQjgBh6CIyWyXZTE3JQ5d6Rsjpy27s77Sk79nTYYVCP6s9Yh
 tpFB5IvxMXEMhv533DquvGB007PIHvmm0ar3NVLiQt4gQZrzRqUT/+One4z6fCFuX+5ISO3SOAQ
 jmx4P1bDQ4zlPiMz+6x0nHlK3usGu+//D1fBeX37NiGwlbih0DwyrhfcQG+j7EMhdSvLh9GTEu/
 axeAqf/10nomb/xCTQB4sm34rHB0MCXVrR50z2TAvj8hPWpSX+NTqbSaumRRb17rXIDoLWq7FAu
 nh/0/z+O6SL3LfFHyoOp3IZ6Q5xjVXA30wloGsfQm4xQZnMHin1A0Jeq6JtD/SmOh2RDDQw4dBm
 WA6GwcBWJDN593+WzVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_07,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090003
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34905-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7C1A13C50B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 08, 2026 at 10:10:13AM +0200, Linus Walleij wrote:
> On Wed, Apr 1, 2026 at 9:27 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> 
> > Enable support for Waveshare 5.0" and 5.5" DSI TOUCH-A panels.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> This looks excellent, good documentation and references to (incomplete...)
> datasheet. Maybe this datasheet has the defs I was complaining about
> in the other patch?

No :-(

> Reviewed-by: Linus Walleij <linusw@kernel.org>
> 
> Yours,
> Linus Walleij

-- 
With best wishes
Dmitry

