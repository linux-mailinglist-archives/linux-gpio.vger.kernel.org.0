Return-Path: <linux-gpio+bounces-37493-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKNgMhpbFWp7UgcAu9opvQ
	(envelope-from <linux-gpio+bounces-37493-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 10:34:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 463625D27E9
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 10:34:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 44F7A301DD9F
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 08:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F03E390987;
	Tue, 26 May 2026 08:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p1c9J6vv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ANvoDPfM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B14355F49
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 08:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779784470; cv=none; b=SvBhGBwPPojcuEmvW2mF/vsJsAUYvBtgFW+u3dTcKLUwlMVpttvOK1hB5axfAfppIGKvO6ia1bKLaiQfI4YIzBBCaLZRTsph5KOr8s3htGQuBkU2Upb0oG+WdhhluyosOyhFHFnl7/4PIe5y9cW8eLkgYOHAl7lK4fiFVn9YC7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779784470; c=relaxed/simple;
	bh=m4TqrEI2ia1H4xi4/l0BCXnlwT5D7v+r5tHtMfS6n4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pIsP6PgNhOsn3NxCL8Pm7gcYoP7MxkgPNWo5toQU9K0IJyUzgGR9ayZBeBBdOFnWQU1uKpSraRVe/Mcv0LFDgErpBi3/tv9zSMh5ft8mPcrmuJmxD0SUkrnr3t3y5yL/KJPDpa9aY7Oi1HOncCD2owzhSuFypxbY3LSVvH5hUo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p1c9J6vv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ANvoDPfM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q6MQdS3263573
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 08:34:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z+n/yokY/LnhoQO4/N7Y/2WIUqMJX5BXyYJU28CcaJk=; b=p1c9J6vvPxzObYFA
	HzcSo4qtpIGKTdvlz72yTPVRrFKR2Xp0eUXbo3bgHCOD/l6RjaWNxC/bemr/dt2Z
	nmAA5nGuQwIlBrNhPDMni2MyXKXgCv1LHBXSfCBAJ+yw9OuzV4nyXlrzq+/3b6qY
	AGPTl0v3TBJfppcH5bali1yaeGMHDpf+nb5qPFv9Yg48luv+cYjxrMkFd/jn7/xM
	S2XqZp/vkIz25mzglzRL0V4fUYMLT5uzxhIdLdk2Tv8hyRMt7a3Z/U46Rv+bjpoU
	DLa9PrwcRniqmVpzWe7diHKSAiC6CS93lQYKP92CnZEDf1AKSLQISiTKGDLSx0ye
	DCcjrw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecnhs3gd0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 08:34:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-516eaf9fb76so46734971cf.1
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 01:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779784468; x=1780389268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+n/yokY/LnhoQO4/N7Y/2WIUqMJX5BXyYJU28CcaJk=;
        b=ANvoDPfMGsnxW/rjH1gxTp9q/H+HVxp0MoMYvYjIi7DKdlJA198kMp5rKqTHgPYcoH
         d8qT3RDGv+mfo74i3zEvOPe0UjlKugL6Dk51HBPJMrTLc+YtWcgi+7jpOZ3iV2KWCME7
         Njtz8vgSCn+ytGb8fgPYvQhsC+vbU2ZtunOsT31r7mQ2g66mZSOo9w8XiY7SC7Tqifks
         BSQUS30w+j9gZlNaFaBsOyWW3aY3lyzOnSpx/s6kNyVFW9el8cXbDuDGOKR8jade4AUs
         HnLUBd9/qwRE4cMq2KQV4yIDbW8lcooFW2o44DJZMNkpNUtZ0O1qLhMhBfTmdUBtbiUr
         yP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779784468; x=1780389268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z+n/yokY/LnhoQO4/N7Y/2WIUqMJX5BXyYJU28CcaJk=;
        b=FlKF62L9xtO0YOYYkPkYKnYZDz1WaK4HNF3wnAhiXXnP/x5+oYGipl8hJ3rAGJGuNs
         MNk5TBuvM1DHtRrLZl7ne9jNXjrNHfmyFv3JlJE4u0cu4v7XnARgUpUQP1ttoyOsAZxw
         T1JPMlaAz0QYT/aqIRqPG9MW854dI4uV19FWB7TkdZt728KmiQJBVxDn5slXoYkyx+cj
         T31a9RYEaYqiH/H3etXH3RvfBNa3Xmch/hlldH9/1iPg9BpmrnPJkZJifi0Zq6THl5B1
         IN4Ltkm9gfKddjg3iDk3Ncjtn1ecxLV2YHx7roh53+yetb9fxTa2QMhQTuIR3USM7Z3F
         daQQ==
X-Forwarded-Encrypted: i=1; AFNElJ9jmrJH7s2HzkQAhVb5x1MJR3YiVel9RP95lcGlyByENNy6qWXNMNWh1bywYEAfqbPgErhw2t+NiWTG@vger.kernel.org
X-Gm-Message-State: AOJu0YwkvKMyqBOVHUFkpYNP+VO5zraVdu3t6/A/XKd/emYew9BfiW2v
	S+8bHEQjJ+QPY2+ayKeRGvzF39xiZyLRSwJ/Dy1utD5Q2QrSxtJ3u1UJ0caCVIVPjYG4jFkjUGY
	fwNpLAj+ez8Rnlwmseno02UYI4ftybg2bfx4X6+olp5eAs+RfJHzkR3H4PNXiNZZ2
X-Gm-Gg: Acq92OF6i4+NzBatI1HARgSB/C4BoHqIrqjKnGSuszNLmU2wKndVMaMBCbouLC8t3fq
	zhOd2jdXTaLNw4mVaJkOWk5Wkp1P04kEWphH1QErjQXHF8rDJt5DK/AYB/VYUdogVbUT8C8PEoq
	iB/Mn5wY++yTh/QIjDUY+V1ZFk/Zat8OWU1jgPgbK/A4neICfgfUK3VXthGo3Ot2/xJzCnxpbyt
	+SOuOdGh5hdwiRYHKoPPQDC+/wukZrOwiBOtBJEyZk9DndGujiOCnJYwLouMZ3QxuFq3xTmJrsD
	WViMfCaDC0CHkMWXyp6vxoM7xlPVJhIKh7eEVV0UzLSTjrGN8Hrl1dOaTnP+tL678BBqsnR6RPC
	zS2y8hv/VrVs5tA0CmX251T2Dr3W91F3Qfl91xX3peqdaounJYS0ND7d8gauP
X-Received: by 2002:ac8:7c4c:0:b0:50e:631c:c390 with SMTP id d75a77b69052e-516d467ee64mr235196811cf.44.1779784467941;
        Tue, 26 May 2026 01:34:27 -0700 (PDT)
X-Received: by 2002:ac8:7c4c:0:b0:50e:631c:c390 with SMTP id d75a77b69052e-516d467ee64mr235196641cf.44.1779784467486;
        Tue, 26 May 2026 01:34:27 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:77fb:9b68:d26a:48e6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49048c6acf8sm92904325e9.10.2026.05.26.01.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 01:34:26 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] gpio: mxc: fix irq_high handling
Date: Tue, 26 May 2026 10:34:18 +0200
Message-ID: <177978444191.19212.9827196149190633847.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260526063504.25916-1-alexander.stein@ew.tq-group.com>
References: <20260526063504.25916-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Vd3H+lp9 c=1 sm=1 tr=0 ts=6a155b14 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=LetV_JAka1SG655h8UQA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: xnzfCdbdmhG-WT2082h73P_CYecqpPWQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA3MyBTYWx0ZWRfX2/nEAgJtxF7c
 EjlnvP47k54IxyOUNS1XXWUJfr0BTrI3fWXlzrwMmLeazSKO7PqXRX8XSmMY0xczakU950hDdxK
 /NSPpwuNpktp6ZdaQhUS0QstPEf/MM30vioiXOgBzkm55/0B8XFdE1JARGv+DdRaGE+LsLs9Zdh
 4LjmxR0J0no6J/XENiRoDWRPUbNEMTYEFu/1trZhDjFMeEdx3zrQfNzXd6CqNEth8vDj5HuDJt/
 /ujyOc+zHQSQ3TmvyznRxezNpVr72Xq15NbtKJto/McYcoKN7EQsZq30vSYsHltykg0aA2ptxQv
 LGTGlAyKTEWkLroufvfPNtZOHAgxisMtau6V2Wun+MRZmaOxtPYyeWUWdNMyCrlG7EFxjns7Ouk
 yq8xopSoPlqGE7EE44sgcIcfDO/dhU2MZo1x/sQ1i4orTjij3urwOAjUTMoAfF5gZIeFEoAvAuK
 0PPoeDiBXq4F1nRkirQ==
X-Proofpoint-ORIG-GUID: xnzfCdbdmhG-WT2082h73P_CYecqpPWQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260073
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37493-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,ew.tq-group.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 463625D27E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 26 May 2026 08:35:01 +0200, Alexander Stein wrote:
> If port->irq_high is -1 (fsl,imx21-gpio compatible) and gpio_idx is >= 16
> enable_irq_wake() is called with -1 which is wrong.
> 
> 

Applied, thanks!

[1/2] gpio: mxc: fix irq_high handling
      https://git.kernel.org/brgl/c/dac917ed5aead741004db8d0d5151dd577802df8
[2/2] gpio: mxc: use BIT() macro
      https://git.kernel.org/brgl/c/077c421b38ab87f32f7ef4503a6add43ae4cb57a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

