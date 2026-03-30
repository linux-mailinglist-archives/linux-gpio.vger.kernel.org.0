Return-Path: <linux-gpio+bounces-34384-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePWnA8EsymkA6AUAu9opvQ
	(envelope-from <linux-gpio+bounces-34384-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 09:56:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 687B9356C1F
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 09:56:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F3D63039880
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 07:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6452C23183B;
	Mon, 30 Mar 2026 07:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f/X3cQoJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aTJJgPJb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E48E3A7F4C
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 07:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774857097; cv=none; b=QyfQcSnIC6XTIQZbRNdHJZo9YzLF7btVYVb2lzBU1wGHli6QBV0ZHZmLWwGqCQ2btzeLUDmZOu+smPTTRMwl/4pNX5ku27dX8ehOG/zVVAIAHJrPq64Z2B3kT7OnQVBB7uvVgH4CMD5MaXA6Vx6wMF1vSukA9L51ghrm2lBgV+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774857097; c=relaxed/simple;
	bh=Wtwyx+rHoNn/JRfhHP9pjHO4uK9/lBUP/VYjCAIasLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O0CS+E6YLojWA8GCfM7+2hV8k8wO7JJLoFyAUs61dkHzzn+QkpE8aox+AXx+3UATMwxeR+JKlTYe769BGiOjzhCGuBPHyhkwVJA7P3rUhUgglA+H84xXaj0PPi4hFYesUk6YodGpMAYAgfCuZ0JRh3DT8OcxjIyqnm9lz2TccZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f/X3cQoJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aTJJgPJb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U7BI3e2224414
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 07:51:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yqoFzHrqxv2RFgrza41YChO6hXH6iktD/zgGiClPpPI=; b=f/X3cQoJzfSxaNNJ
	SslrptOyEa6kU/3sYL37JXfPf4H5sWE2gUK5ZdQmU66p8CP3ejEqYsAudbVz529Z
	OMMSvYzPf3GfpaYDprJSd+T7w5E8caRtrXX8Dg49H3k9VmDjer9OI/5ZLVZPtwk8
	GqCVoStoethN1LcFwZShhFD0xHpSyhn+erawUAUBGUekzI/9Sg0F2ARJyNjGHZ8M
	uRCN7l6oVg98EUhQa0EWG1XlotJqKP5HNxoeW9xfZhzKui0pMSKG3a6KKKMxJcoT
	mifY0nmRti5xNYebm2qXbUVEIx8nzBQlJG2pCKn2jGleXPl7Qd97lC7388mAMFmO
	SoJoFw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d685hcyp2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 07:51:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b52a2d70cso125586581cf.3
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 00:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774857094; x=1775461894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yqoFzHrqxv2RFgrza41YChO6hXH6iktD/zgGiClPpPI=;
        b=aTJJgPJb2J7GAiDSkgufneruy8iM6oglLDBQjDBOKvIF5lWbVN4DfPd8UmUA0sSqIW
         5lzXnExwUfsuE9LSGDkHOgyRsqs/eH4a9SA9B7hQ2p7Cwzsi6pcSbx+eoOXS2wwuSu66
         +tF6kqKjux13Z/0TePl1bfp75EoFD555syK44oawM57aiWmyl6P7wG/znGFJU/ZAG7z/
         ogRYPPDTq8VzvLYVJHkWNLOMDQ3Pjh0G2d4dsIpSxV7i4HVBaLYefmWRAm6wovb6LzPH
         OxLBVQVOkbk8ZfQTJTh4+LGvRHEcVk+fMr5P7wQVj7lWA6ITHJH80s2YzoOA9muyfIGR
         9/DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774857094; x=1775461894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yqoFzHrqxv2RFgrza41YChO6hXH6iktD/zgGiClPpPI=;
        b=WPaqoI++v1LIHy6cK5CbIGSWJdJ/WAYFdFhIcr5wNoOb2RVl9PTpyhrfK56D07zeEs
         yg1jjAGH0we1WsbWX3LQcHhW2NDzeADOayqByTeU00su1aAJFi9JJzdFScEfc1cB3GnE
         JAzM1Uj6C1jK58/Z+M93xUz/eE5QqDaLcLyloc+FdZMXSH9cxNQahAvTzAJXhsRy9ScH
         397ATZZtEJgAxGc3jU3CTdNNrWLpQm2EzuQrdT10JVQy2fxV2oEWflA2Qcsa4mjKNFU2
         /rpb3IaPZ2LuC+mqQ78mh+qtpxwckDwEFI30MRm45Kt02sHOVvhxiBtNUFFx9G5MWahT
         sk0g==
X-Gm-Message-State: AOJu0YyXnAp9pr92iuoD8QYM9VPdvS624+pe4V77inpacEZmmyj+SxgO
	Mxpl2HMs+UGP6cFlFvlyoK0Qiz7a2fGD1laXze+f5ms6ojudDQdXFsaOTpfiYE+oLGhaaUGDQHV
	i/G56fY1SLTkgn1jiBOizSQvUlaypaInv6WYDZpTQdjztGBXD8oF56L/ojIIlPWY8
X-Gm-Gg: ATEYQzwxfa0KgeinhjUw2cM2yB+2ITdZqO1ApFaV3YkCnDStviy2Mx7qOUDOI+7EI7N
	dmm4TSzdWFp307dqE7oMTQoMmAxMWqD64bHewRCMeIfzyOFKgtrU/u4WpXOkAkUrUZdGqRNN3KN
	S+++7P5OthfvqQhJr8pHXeUde7yh4OR9u6eX0rsAsePaxlwRRMRuLVUQsKO+x0KHdI6rBCvV/ee
	9gyxbYB3/iEoel1MFjhsBj9wfjZPoC7llxbIJjDhfuDRD9u1ehxo9Sz7zjPGiQD8duIf9if9I2H
	KAX+2b4q9TNQdcGig9MjdXIR+e9q/2ll5sz7yrx4SDOaI2WPRNxsOyszA+pEN5YahHkfe+hx21O
	tm9yK5CuXIyimX5+56QUb+8NnQyyqIfgbX/Yj8Wmow+iB9fTNq1M=
X-Received: by 2002:ac8:7d8f:0:b0:509:1ee2:69e4 with SMTP id d75a77b69052e-50ba380a5e9mr165178601cf.11.1774857093972;
        Mon, 30 Mar 2026 00:51:33 -0700 (PDT)
X-Received: by 2002:ac8:7d8f:0:b0:509:1ee2:69e4 with SMTP id d75a77b69052e-50ba380a5e9mr165178441cf.11.1774857093552;
        Mon, 30 Mar 2026 00:51:33 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:1143:869f:e06c:4587])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf247472csm14706938f8f.28.2026.03.30.00.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 00:51:32 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH] gpio: shared: shorten the critical section in gpiochip_setup_shared()
Date: Mon, 30 Mar 2026 09:51:31 +0200
Message-ID: <177485708802.5892.11250894850372032857.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260325-gpio-shared-deadlock-v1-1-e4e7a5319e95@oss.qualcomm.com>
References: <20260325-gpio-shared-deadlock-v1-1-e4e7a5319e95@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=csKWUl4i c=1 sm=1 tr=0 ts=69ca2b87 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=rx2hHsDi30GigQfg1aAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2MCBTYWx0ZWRfX7EPeaImYaBAK
 HUjoWxevmYf3IoXPqix2csiHdQTtsFUji2LzK5KUNdApw4rvkI0P4y3ysATQTyGyJxbNUISSe9x
 jQ/m/ej8KFUZNGcZ0JwDJAMNk7jADUGCwXUJU+3ELJUOj1WQlY+LxCsON5AMcwk4/Rs7ZT0V+t1
 sLsatZHuoPHnmkGZWOemIJGAkeKhhTUfm3rRggQtHpmjXZU9QCJf3Dq/3mAvRuHeIHCjqJq9Yoz
 OU/FF7NJh4MlxJtDK4uH8J9SDKgFAaAXE9A2NZecJ/Iq5kWbLrLnIYoKkEGyunNt0LooHlgNo4d
 pYy7cWfFQwfW36pF0zvSNSxMM4ZEaFLW+dtcgYWkdDixjnG8YxnRtJPU7F+gENyL88omZAyuQl1
 WB6l/sy/FIJdAHgQaMZr8aHLevl6TT9fH2nDA95oEn33QJcXZCLVwCR4Tin+kKfWgOZmR+YJCbF
 SKqIWIjXJsDnMMOwLJA==
X-Proofpoint-ORIG-GUID: nGusgWZaoeRSXquemrOry6K1-Uf-Y3uc
X-Proofpoint-GUID: nGusgWZaoeRSXquemrOry6K1-Uf-Y3uc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300060
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34384-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 687B9356C1F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 25 Mar 2026 12:06:38 +0100, Bartosz Golaszewski wrote:
> Commit 710abda58055 ("gpio: shared: call gpio_chip::of_xlate() if set")
> introduced a critical section around the adjustmenet of entry->offset.
> However this may cause a deadlock if we create the auxiliary shared
> proxy devices with this lock taken. We only need to protect
> entry->offset while it's read/written so shorten the critical section
> and release the lock before creating the proxy device as the field in
> question is no longer accessed at this point.
> 
> [...]

Applied, thanks!

[1/1] gpio: shared: shorten the critical section in gpiochip_setup_shared()
      https://git.kernel.org/brgl/c/310a4a9cbb17037668ea440f6a3964d00705b400

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

