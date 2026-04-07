Return-Path: <linux-gpio+bounces-34805-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKh9BEL+1GnOzQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34805-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:53:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9476B3AEB0E
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:53:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 56E9E3009F1B
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 12:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 514583B530F;
	Tue,  7 Apr 2026 12:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DY2JGGf0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QQFsZnGS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C5E3B47C1
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 12:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775566399; cv=none; b=X7D0d6iSDrjxHa434+mDyMutXAsptnwMsEK/LUhq3KtwCFLabLEKbwCBTxMkBAHy1OeCjm77/9g6KFb81r8LgORMkNxW0CPTydQT4W57qPYAJXXuBKnAOgfHC5AtmtcjmF6bp54/Pol1kup51xV4QXsu3yJdXp4AO3CAJ9U73bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775566399; c=relaxed/simple;
	bh=lWCMzvoaNvdS+SqX7BlFRi7CReOqLHRhXz6EGJAy5eA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WhLIh/wOWtrg59mP5ly9rRiRwrYCSNVrZW/xVu4JT/bcbVK7iKjKBg58UoV2P4xvHsceYZX8r3isvULT49292OvfBLLUeRHGFxzzN7h7aV520pdIcO1dMP0YGCXCbAdqvCXTeZz4aTGoBzIgtahgdTx/qu8IEQDbimQFo9iSyk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DY2JGGf0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QQFsZnGS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376aGM93815231
	for <linux-gpio@vger.kernel.org>; Tue, 7 Apr 2026 12:53:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AgeQrav1wRmWq+BfVKp9oTQm870+NeaWSgp6eiSjnIk=; b=DY2JGGf08oPXsMvL
	iIcu3CNqWx1gu0BrRvW7KryMohV3Ob8DrG8BngGmQ21SBGIoCd69cPOD0+KHHcA/
	Otuv3sW65u/vgk6yOQHU7TctbDXxNFphuOnwrOIXtnWh2TTSTLayOUNgEuguR8xA
	0cf7jeIfIy7g4UJDAKZyrxBjCVBBJ4qEdemkepzsYHoVCy1WZz+7PrN1WE1LZGlM
	JXtfzj1xduv1vs2Y4YlhRsl1AxeCe2b29Xg8ICfhrrjDi2iZ1le8zTbTIgEuyqdJ
	WBJ8Bbf93T5JA4M/Bp/JupdIJ42sDtiKeCUibAboVgjhVZqgBS0EZFOVBXwGfjYR
	CW3Lpg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr4tstw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 12:53:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8dac6233so45301831cf.2
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 05:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775566395; x=1776171195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AgeQrav1wRmWq+BfVKp9oTQm870+NeaWSgp6eiSjnIk=;
        b=QQFsZnGSjFDOgvrczLIds3vmkE19dVOkpLI3fPIceJW66WXPiTgp/4EYBOalG5p7AQ
         ZT3USpXD45fwKtMmplKy4yBoekZnht4CFJj8Usv23ybXeO58L51k29P6sYckSa8OXN6V
         06Ps9UAsUsFdVEzQ6nJ713j54CtIRD9cnxyEDgJ+RlCSkoaxnZxPUKcNeCUP/tHQTlyR
         xugfSZ3bIKHCG0rnLun010RW/KsgnQPTQ77yMGHd4PtR/YF/yY3kzSTZITdjCcXHAHS9
         PiySwiz1THwBGKDTLxtGdtVf5/8OR+PHZZK4uDcrj3tyergBBG0a+tFLLokj+WSzcNK4
         khHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775566395; x=1776171195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AgeQrav1wRmWq+BfVKp9oTQm870+NeaWSgp6eiSjnIk=;
        b=AHyHNa5EnF/vFGyBdeFVKB5BfFQ67MzXde5hIB6qivKS/Dq97mdwoDS5s3ztyvviU/
         kg2HqFVGylVKsLBFjevwB/Ro7CQ3/dr50REVB7Mp09fqmtvI9alCrPZa9uJpbSf2pAd4
         UvhSh9zyPqQDKjuPDYMVE5Kx+EuwLdnbOEv7DInwAye3T5tZWDhuAHEr05qQ2hawb0qI
         Z6ob/V1rAQDfPQSTNAVKuAmaENIeEFcMs92aNbapeXN2Gv48caJA6u1JWGB/6zs5Qwhi
         2eZtybGGBQRknhddKPc34+0rQqS6R+DW1Q/iE4ifG9jCOMHrG0G/RwMqBcvWP1svVoQo
         dtzQ==
X-Gm-Message-State: AOJu0Yza+IKOQgDdfkEYA8hW4rig37Q3yAqgyXJ0aOxt52GHWMW8rMog
	aBANuAv6J4eCyyNUor2d++vt+AT5XZ94SM3O3tN8N9g9P/mBd+fKnnM+IiiKvy7TFYKOEv4qN12
	r73Yo3ySKLmPFJ8PDUzpcKOFL1/f19i9UI6AITjuVypz82xlynVqO/DOVyMhfTSMzaKZ12VId
X-Gm-Gg: AeBDievnh/cU0X8vL0sHD/CzJkHI7QgPDA3/+yaTyJ0T9v3Rh94+YdHCuLlww4SxtXF
	4vLNxLjSgz/tRISskpJ4D0AOvEBADhaBxge+Rf9gJs4jxgA1Vo3SuRFgiWN7oWsj3/igzHRu/tS
	YOngTyGJCeRXJqwVZuGotF8nUJEmpiblW+WsrELmDMSF+HdGvRRMFqB4HDLzjj5c8d9Oqt16m5F
	p35rNyv5MHNazBl9liIUpoXa7ZT5Ul++S2i/YlB+5g+kceS8yPWz3yWHD7pOO8yUEPsHDgFL0FE
	k2PO47PQ/sPBf7QlQzRcHevGYZxGa+QyLw4YcDvhzsRIjy/7GgWyyx/0++BzrWbY8LUp5qZ4iF6
	P7oebpHfE40mpdxidxnmrm5V4n0Nterm0ccb+RfignYG/rvZujg==
X-Received: by 2002:a05:622a:11c4:b0:509:e68:22de with SMTP id d75a77b69052e-50d62a70514mr254762891cf.32.1775566395284;
        Tue, 07 Apr 2026 05:53:15 -0700 (PDT)
X-Received: by 2002:a05:622a:11c4:b0:509:e68:22de with SMTP id d75a77b69052e-50d62a70514mr254762521cf.32.1775566394816;
        Tue, 07 Apr 2026 05:53:14 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:b36f:5370:5f91:2d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e83682fsm577672435e9.7.2026.04.07.05.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 05:53:14 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Vincent Fazio <vfazio@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        brgl@kernel.org
Subject: Re: [libgpiod][PATCH v2] bindings: python: allow closing a Chip multiple times
Date: Tue,  7 Apr 2026 14:53:10 +0200
Message-ID: <177556638700.273757.5063997440487718464.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260403154604.3944747-1-vfazio@gmail.com>
References: <20260403154604.3944747-1-vfazio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dO6WXuZb c=1 sm=1 tr=0 ts=69d4fe3c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=8AHkEIZyAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1gI_lNj3TX66S2H1XPoA:9 a=QEXdDO2ut3YA:10
 a=0lgtpPvCYYIA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: cdcKqqeoRn7kuM0tNmzsvGI9QEEF1mnK
X-Proofpoint-ORIG-GUID: cdcKqqeoRn7kuM0tNmzsvGI9QEEF1mnK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyMCBTYWx0ZWRfXwxZLF9eRUXY+
 dzEhaAeOygWwDizS2OE8N/47wuSToHZOb+WODWOk8zPkjs52M1poa4phCxzhpA8D4ZzXiHZnYTc
 ul0RzDffFVphT3ceCrd2s+IpbiUWGQaxSJ1vL47Ra4YxXfHlyuoy1l5IJmknBXv7duzFESR3Kl0
 fyt1xYfi8V94NVBokOncF3Oncx7JqU9IksS/2hNbwHYOsD7zFxj/Kl8sZKcbG8yChnzeweAyDKP
 DCPZHMMVPcpp0stnQWmMekbq8ILAQbW7q3G+/SI5BozsPV7Jx1A2Y7bujWIZrDGQjmpy4YJ+N/W
 WVl6C8CkOBRQJBQT/SgaGncpY/QFth+u9KvJBForUGJf36vd/1ND7RYI8YwLMVLwoVQpc7s8FmP
 SorCa/xq0ZRjewplhxwUPcH99NkgXLtSBYvmE4IoMzC+sraI3RamHv96VKUTtr03dgJRc23Tyv+
 0IMbrM7LGqAbl/6FJOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070120
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34805-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,python.org:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9476B3AEB0E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 03 Apr 2026 10:46:04 -0500, Vincent Fazio wrote:
> In Python, it is common for objects to allow their `close` method to be
> executed multiple times out of convenience. An example of this is the
> `IOBase` class [0] which is the base class of most file-like classes.
> 
> Update `Chip.close` to follow this example.
> 
> [0]: https://docs.python.org/release/3.10.0/library/io.html#io.IOBase.close
> 
> [...]

Applied, thanks!

[1/1] bindings: python: allow closing a Chip multiple times
      https://git.kernel.org/brgl/c/711a05b2548718b22faf8924a8b301a4e8cf4852

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

