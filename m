Return-Path: <linux-gpio+bounces-34907-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMh0EMP31mmQKQgAu9opvQ
	(envelope-from <linux-gpio+bounces-34907-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 02:50:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FA33C51DB
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 02:50:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 36102300FEDD
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2026 00:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D44C261B9B;
	Thu,  9 Apr 2026 00:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H997VMoG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cHV1FgJE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA23C72623
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 00:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775695798; cv=none; b=rhiIXNR1Gl/edyKW7XR4Lvml1cm8H81UgowxxgEdoBMpBhNAOnr/2Z9ZxJA2htNbGffi0qbEE4Yn9MNzJwfVVylueIMz82aTIQcAYa4NEr96rxPb3KNaeldbeQYjhGpReyZNbSvfnr6whxk71G3QeDXGUrEEAdeRijgjdjkzzrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775695798; c=relaxed/simple;
	bh=3okOik6LRshMM4f19RzdCp7PI0VZaZepZ3WWKumDOtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y6gnzIUPnxG4+5eT8zQfPUmzRIxA+/kKiBLV3GPaN4vNDdyemefiyye5/GqCKC/YcmCNKvJo6cm+PeLuG5yZ2nPkKrhO08aIGyAEoFWpQLrLFVaHY6dbPjr6zYoNKBJmJgkCWZjF6f7kgZonok8dPBhqGu5oJ1WCEH12UWwLFXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H997VMoG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cHV1FgJE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638L0eia468597
	for <linux-gpio@vger.kernel.org>; Thu, 9 Apr 2026 00:49:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bqEE6rmLZOuTWDnBfLI0DnPCbDUB+b65JdryhdhG+uQ=; b=H997VMoGJtsBo9IP
	5hoqIg7GV92AcWKMb8ztxkKxeiK+7qXPwfWN/IcOtKTagUwXSixzQLjsquQ13ngp
	QTTKonO8bDJq8Ih0/tUiHEN0P+draBnmYPBhThZ35T2LINShFDimMI5Zx/0CYtDX
	lTeaizxr8uX6MR1wdKk31hsLkbXTvDWhRS3ptJJL9vtL2/XkRPSfEynVJbXddsfP
	0aMvMU8gO3Dzl1iuZQbWWZrNqtwj1FMLQXjtugwRdidjtjR7lXREY27ZzFFKi15v
	adVT1JkMUepaDUZptultXwq07GC6UfHemKx+ThlJWox2mR3GdDDPeTvFRDW+QmAb
	78ZIvA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dduvv1atb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 09 Apr 2026 00:49:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50da31af14cso12464101cf.1
        for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2026 17:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775695795; x=1776300595; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bqEE6rmLZOuTWDnBfLI0DnPCbDUB+b65JdryhdhG+uQ=;
        b=cHV1FgJERC3h5ANAl2qhMQQ+xWS5t/m/MwH8Kem+EC+CSu91vXvZklQSa6ibfYqYnP
         Y+TgLoXIYHZMNw86+ZCiklYGOpZfKObcO6YemK7ZWd3Pc/0UYtM6w93LQ7AMua0UCwyW
         +Gg5N4kUBQM5duO0sieFI4XXOKtFnBljAFwWm6JCLo+UbZMZvtJlYhlH51nsG7t/XUVC
         OkaZk6gt7mn0CamQPO41tBeqhuKWMEQuA53Ax0Ka7jDCCJzDkcBQrEppz1FO7AiUTeQy
         SWxXfG675KR4ydf5oCRHs/W7QXcaEU7Wpfeh1Vz/EF3o0usX2Am6MQXFQC1WLY9yMSCT
         ZEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775695795; x=1776300595;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bqEE6rmLZOuTWDnBfLI0DnPCbDUB+b65JdryhdhG+uQ=;
        b=Q/DfLZAoyfTFrad4ITws2+ONZYaZRAKy+ut0+pJcX/ovHtNY17Wkrrw99xZtVyPzUh
         9kDrom3D2zxrzlpRtF8duvU8gfHsnDwKrl43ZCt9CGOhu9r5qfnNrO83ECI1F9A5nabX
         /ip/zUAYTk632JiramDjCm5b5vs8/QA3H1uxo7GNSa7Ocj4UN5DkRNyb/o7Ft+fXM8bw
         vjkzSTwWNF5Nq+4IJj+fLzDbLihgyMPrWhIxXA3e45mbQoMIURjKW4IXIf6j0ku/K806
         hZm9gRTrCThB9tNuTMJlaxcHViRId4iYuGkrm0x57sG8pVIJJSrOUAeeYuel7P1DSyv2
         7NLw==
X-Forwarded-Encrypted: i=1; AJvYcCXMpAMtQwdYMfV7ieI2jvJAZdgUCfKkH4598Dq4/F6q2GzVBDXsX+GoNyD5iEmxtzWd6FhPWUQWmARF@vger.kernel.org
X-Gm-Message-State: AOJu0YwR3F2rGhoFruK7ImDbqegyrJWMIopOvx1aEQRItwyYPXZ6cszG
	Y95PbCCsfKTMxg7PDO/RlpIdFzCueRn/Ew49s5Z/4Fpd6+rlH+MXX/zfVm1+BeFGAzis1j7PgjI
	rCVeYoAaxx04Hkj0QxGSu2lbrtfBVibWOffcFiCJrcBtjTHw/neDIjNsjzdOvHhsm
X-Gm-Gg: AeBDieuV/BH14QfLLyVzYb0O3ANHAuZKMu2EFWcuwyBye9Fo9B2GaAJ5RzI5Z1/44Dp
	987Jh5GdvAOjLeJSc+JLzh28lEaz/hGvRAhYEmrMk3qC6NVraootJA4QqgVCJvtFORwufUiLQM6
	XHzv5UlLktuEY59G/9wuamFl4bP2RdpMGkkdwfrOMwVBrIfqBfYMQTTihu6hFb3KyrjZqKzrGFF
	klCHkPZkBf+eUruaHsyBPKiztdA4N6iUziYI1k5LMzC0PEFrdzn1E7N+kFZ5ssknK6kP3arlSOC
	V7xRgCTqYL2+YG5eyWu21WsDVuivQ+mMZuCgDLzSdcRhtKDoVIkljITqA7pkkONj8IZ3c+Rh/Xs
	8AEW4+2l9vsayPQEyew1TYzWJ5hTTRCaqufGT/8YC8YEoIWahS3/WWIPoT1twjzxixfY7F5of/c
	pOjCUNRZZ+SqiWnSazR5oziSAUbfDhQ4T3Dhk=
X-Received: by 2002:a05:622a:11c4:b0:50b:4946:2776 with SMTP id d75a77b69052e-50d62bb43c2mr334343421cf.22.1775695795211;
        Wed, 08 Apr 2026 17:49:55 -0700 (PDT)
X-Received: by 2002:a05:622a:11c4:b0:50b:4946:2776 with SMTP id d75a77b69052e-50d62bb43c2mr334342991cf.22.1775695794781;
        Wed, 08 Apr 2026 17:49:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cd34f0sm5150705e87.76.2026.04.08.17.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 17:49:53 -0700 (PDT)
Date: Thu, 9 Apr 2026 03:49:50 +0300
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
Subject: Re: [PATCH 14/19] drm/panel: jadard-jd9365da-h3: support Waveshare
 DSI panels
Message-ID: <z3obsnbmdvvlzs3cxm57osbax4ivg2zq2zk6xgp37n4hni7y6i@smwn362nhn6a>
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
 <20260401-waveshare-dsi-touch-v1-14-5e9119b5a014@oss.qualcomm.com>
 <CAD++jL=jUd4sQ1bhwcBRYpFFApP6vdJw2BoQwxoWShUKdEb9oA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jL=jUd4sQ1bhwcBRYpFFApP6vdJw2BoQwxoWShUKdEb9oA@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDAwNCBTYWx0ZWRfX9H5tKirU8qkj
 sx3aHBjpewJimp33TFy7XLElFWnFpOF8aqKWAFYPsL1yR/Mo4LXj6v9Wf1alykBaXJyyXizsd/M
 1i6xnU2yY2ZJVYN9kSDafn4/D1v+M4YjnhDNX/dJmjMy3yYC3C97DbG2g3bN5x1mKlHip0jz8DL
 f2xoqsohI6kW5zFZl88IckgHfnKCzNeaN3EqsdB5skh+9PdRZMR7AUuZQlKUlKJT2VDW1XgduGt
 q5gYSsoVZsu5s1mQ5A6CJbdJyS2Kp4bwl0aB9fH9i+jULSsn48RCQFPIWJFzrtv18UjgJTUc1n5
 GvlokdkmX0VRFmj00xEU1sGVBqlITX0/3DLnXfGenMSfC+m/dWTD0w3rwfPpEBWiCT49Mtonp0C
 Qaint/OQxiJkcr+dUcHRlesEuW+YPfbiz4GJSH0A+4ov4fBabDWTy10uWs7FmtJXQOND+anxlXj
 kLcGb0/w565qt5D0LZA==
X-Authority-Analysis: v=2.4 cv=DrxmPm/+ c=1 sm=1 tr=0 ts=69d6f7b4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=EEnmvuoukryqth22VUsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: _T4I5ou42DT-d35fNcQstwl1PlsACnVx
X-Proofpoint-GUID: _T4I5ou42DT-d35fNcQstwl1PlsACnVx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_07,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090004
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34907-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 79FA33C51DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 08, 2026 at 10:24:17AM +0200, Linus Walleij wrote:
> Hi Dmitry,
> 
> thanks for your patch!
> 
> On Wed, Apr 1, 2026 at 9:27 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> 
> > Add configuration for Waveshare DSI panels using JD9365 controller.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> Some more words with details on all the panels added perhaps?

:D

> 
> > -       desc = of_device_get_match_data(dev);
> > +       jd9365da_switch_page(&dsi_ctx, 0x01);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x00);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x41);
> 
> Predictably I'm not very happy with all the unexplained magic and nonestisting
> defines used here. Do you have some info/defines?

No, unfortunately.

> 
> But there is also one more thing, this looks like a big "jam table"
> with just register+value tuples, so construct something like:
> 
> struct jadard_jam_tbl_entry {
>         u8 reg;
>         u8 val;
> };
> 
> static const struct jadard_jam_tbl_entry jd_3_4_c_init_jam[] = {
>         {0x00, 0x00}, {0x01, 0x41}, ...};
> 
> (Ideas taken from drivers/net/dsa/realtek/rtl8366rb.c, take a look
> for code and all, you get the picture.)

Few months ago the code was moved exactly in the opposite direction. We
added all _multi() functions and made shure that the code is as
efficient as the register tables. On the other hand, having it as a code
allows better control. E.g. handling 2/4 lane case would require extra
hacks to the register tables, while the code handles that without extra
hacks and without loosing effectiveness.

> 
> Yours,
> Linus Walleij

-- 
With best wishes
Dmitry

