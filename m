Return-Path: <linux-gpio+bounces-36512-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DFlKmmNAWqNdwEAu9opvQ
	(envelope-from <linux-gpio+bounces-36512-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 10:03:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC28509C2B
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 10:03:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 34A7C300B1C3
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 08:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6BC03B27D9;
	Mon, 11 May 2026 07:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bwwDwwZk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D5Npoh3z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE903AC0C4
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 07:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778486215; cv=none; b=UwdNUxg2n3ooNt8r3Dafy7+QDVZzpUrQBoKQ3/x3xSEEH35SZ2SQM7s9/gbzTSK2LMmmmhzMtgtGpFbokKMKiYYwbvi2OJnOYuiJfyJSgth/AbXwKFw1P+squ/X9KxC3Nx+JDhPNdtRXB5/TXkyYdXzrIxhgRcG5pFTeqI8Lj3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778486215; c=relaxed/simple;
	bh=u70zE9kKbMu8cXkcrneFHIuTZ9n+rPXq/dVjJ9bP4jU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QjdL4+MpKUQgC2FxruST39SgF+uWzrt2zbA2KslVa9O6I6dgLRRJ+rAv4vBQOVXGs0xNTMNBKnnoxvtC7mWL1i4CYA4MImkK9q+1/qyUV0HZRyPH5ArIso10CWCNIUkAREwr8/+jTM7dfBsYuX9v3p6rQQ3HmpwiHT4N/3YpDeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bwwDwwZk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D5Npoh3z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B7FRXh3333307
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 07:56:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Edmbg0v8IiJzMS7+pZj6+O12JMZo1DqojeVoLzn6d+0=; b=bwwDwwZkN19D+dg7
	Qik8/CgVd7cIyqU0UOPCzEc/Eu29+h/67A/pWrjZNsY8tayPTDjBCAUO7KEo7a/k
	D5LeIwhJk88/xoNslggq/5W09RT/ugioF4GNw32Jj4ZVDRbB6FZ5w/ZzqVMIZg0d
	hB/Q6kGrgbozOdQbqz1BzwGP5i98MoiVqQQRGMuF0UtAQJMM9REHLjJehnbMwXOt
	+ElcxCGGfJwGOWrBsqw4xYUdnh62Gq9uCV8W+JMLlNyHA4h9sjpgYaDstq2K+yA2
	DPVLWI6ufoTiyYte7XssBqedVBxKJxoLvAxH1TRl7BqJ4dBTUKFXL4iZqR5bAUIZ
	qL4qvA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3ajgr54b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 07:56:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514ae0edeb6so31797561cf.1
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 00:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778486201; x=1779091001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Edmbg0v8IiJzMS7+pZj6+O12JMZo1DqojeVoLzn6d+0=;
        b=D5Npoh3zkYXz0YdSiV/xrnNxejxmG4SLbuq6vIHuz48W+cnLmCs05Yem+fXbCh7H+y
         FjYt2ZsCC4TqSvJM/yR3XN/8SQqF6tL8EwIqSF4S7trM5orsWn1G0E+0gXs67ACagu+z
         5jQ0luvExa0b/1V4YRP+YswU/XCeFB4xHMakopQs0/bsfo6FAY/hzvB5n2+xogT8AkRU
         pYj4e0teuf5Iw7RoIjb2DJYeXUkbR83YhgLauVMO5VaTrCSkuE6HhOZJO59xJGGlpn0j
         nZBFWxw0f84BcvTcd2m2N8nk7VueVMBWr5RFoblkgWYnUl76SVOl92ehH3xR7ldd5QEV
         K+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778486201; x=1779091001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Edmbg0v8IiJzMS7+pZj6+O12JMZo1DqojeVoLzn6d+0=;
        b=b3Mv+ArR0+zlUJJoXm+nuOGldHF4mOjGvl/4AWiQkjNFoiV9q1LTvxvpeK66fecK16
         emQoQURERYE/bK2YjzqD0MkgLQnuVRC/p3Jjwv2nYKiEAyqQXlmxJB2XheyoQW9KXdcY
         eQnijON3IQUsRzZRBEzKlgzZoZb89VzHcOqAUFUnrtZB89l89dLyCEqIfAPDXwbU1nCS
         fPFg3AWS+vyUBvqg0zLXYnvDzYDhPCXTfknGgFOMpVQJO9c/p1FDOmj8aN8/iAvlwwe6
         k2+ZfYBRgmKUOFHsHmLqFyc322cOCLnVA+dcpOyX3c4L2DomS7+/MLEeEeJ8R/EcVe7s
         aLaQ==
X-Forwarded-Encrypted: i=1; AFNElJ/QFtO385Pf/nJcJDainqHHCEtWggT7UBhTg3VPe1dmQ6uJ5lqdbucAkWvaDbaK/zqYu3sYU1sksoYh@vger.kernel.org
X-Gm-Message-State: AOJu0YxSs89OddpjLit3+ss814haI0IdtWVYgt1KnX5IJ2L3CdUuh2zE
	jNoId2Bq19XPxUzUNCvBd441cPFFbO6jJeyE0lBEso7Mbl0n8c29V6xnHgs16Y4wy3Po4PmK3dm
	fLFMWuZiO6KiJYFEa2y9Sxj1cziucq2LApqUfdAosF6lTKGiKWZqmI846+bChA4eP
X-Gm-Gg: Acq92OHSJrnpQ7PEEfVa9I4vmZedl4o3aAmQWI84LWhXe+JhqbKJMETsEyJTYJEB5Zl
	NALWhJ5gNS3+xlNy9Xs+VRVCdaJLjIxclzUo6Mw23vGt936bBluIuZ+wu0CS+LKDmMQinjZaWwe
	OZeRooUKHSsr6iwsC+4UKMIvEeoy0K+pjP12gZbx51NFcK2t6+OKlcexxvBDV0UsoYj3q9vh/eN
	PqgaG7OJT4bzL6rCScRq3ea+Lb97UIyR8cjsNctcsVGR4sAD6fSHJesQd8GlRRgDrG4ANSH6cM/
	n7lp6ZdTZPyUg9slQlrYvOc+pPEtPppBnUL0UrD7K208f4FP4S6rDhsI+qmeyzOViUn0voQP96k
	8B1pv0jFeeFnTX/kHoCdTHv2bkpPtrwQa7SJqvSe7y8n6WlWZ9g==
X-Received: by 2002:ac8:7d03:0:b0:50d:7632:ddb2 with SMTP id d75a77b69052e-51475b70afamr199095361cf.12.1778486200753;
        Mon, 11 May 2026 00:56:40 -0700 (PDT)
X-Received: by 2002:ac8:7d03:0:b0:50d:7632:ddb2 with SMTP id d75a77b69052e-51475b70afamr199095251cf.12.1778486200306;
        Mon, 11 May 2026 00:56:40 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:63bd:c2f9:cedb:aa32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6c221sm24431737f8f.13.2026.05.11.00.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:56:39 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
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
        Bartosz Golaszewski <brgl@kernel.org>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>,
        Riccardo Mereu <r.mereu@arduino.cc>
Subject: Re: [PATCH v5 0/2] drm/panel: support Waveshare DSI TOUCH kits
Date: Mon, 11 May 2026 09:56:37 +0200
Message-ID: <177848619477.10327.8599254658370877009.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260507-waveshare-dsi-touch-v5-0-d2ac7ccc22d4@oss.qualcomm.com>
References: <20260507-waveshare-dsi-touch-v5-0-d2ac7ccc22d4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GfgnWwXL c=1 sm=1 tr=0 ts=6a018bb9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=bE_KkYOeAPwlOS0bxDcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: EHcIK9HMoEE0Y-t8jzD0BjgrQ85ub0Ww
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA4NSBTYWx0ZWRfX8y3ILXgtd0Lm
 wM/tLpCxJOs/8zzgL9mD6OjUKs05BgSC9+9gGqKAC52FM6ewrZncWrgil3VhHntbc05QOzQD9oL
 fAmkqmJYucy/yHP/7barM4Izbi9vQaKoentLOH1C/LO+R3XgYo3MxSzPcwEcNbCffKcvFHEB9eg
 pifYc+9/nUwSV66ROGNAn+GEq53J9mWPFNXo2RS2PjWYM55gCW5L1Xw0QsnIoZIpQf6/Z6vdLYr
 bOstwn39QyWnHWm1OS5yMXuKr3CRS+GwohfhM6jGt1YYk9L+X0YL3NVgH5p0VIUip9W1+J3ZJes
 bBYef74e4hGSpTT5vTYXFag9nH5XV0XQ4cNd6ykBEKVEmBWpwxfpS9eX5YFv0b2GsN4LGNpUOIv
 RlUZN4gcCbEbOd7cdREePHjvtsxG1XRLQAzE4yViARfhVvboXUooLQJlBdVE0wZAhL2GfGvBTxx
 XOOyouAGdwW7xs6OwOQ==
X-Proofpoint-ORIG-GUID: EHcIK9HMoEE0Y-t8jzD0BjgrQ85ub0Ww
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110085
X-Rspamd-Queue-Id: 3CC28509C2B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36512-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On Thu, 07 May 2026 12:01:31 +0300, Dmitry Baryshkov wrote:
> The Waveshare DSI TOUCH family of DSI panel kits feature different DSI
> video-mode panels, bundled with the separate controlling circuit,
> produing necessary voltages from the 3.3V and 5V supplies. Extend panel
> drivers to support those Waveshare panels and also add GPIO driver for
> the onboard control circuitry.
> 
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: gpio: describe Waveshare GPIO controller
      https://git.kernel.org/brgl/c/8cd19f5560218bf263b8ffc622ceb4bc329b3bf5
[2/2] gpio: add GPIO controller found on Waveshare DSI TOUCH panels
      https://git.kernel.org/brgl/c/79f44c8acfe66ff8cbed5626e2535245cfcf43cf

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

