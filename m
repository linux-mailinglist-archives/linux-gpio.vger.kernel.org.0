Return-Path: <linux-gpio+bounces-34422-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJ7yDQVCymky7AUAu9opvQ
	(envelope-from <linux-gpio+bounces-34422-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 11:27:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E503582BF
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 11:27:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3369C300616B
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 09:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B17A3B3C00;
	Mon, 30 Mar 2026 09:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AEXQYG57";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LiABGweA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A4C3B2FFD
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 09:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774862847; cv=none; b=ryJiy5MGEmx6zFcZ4yQiXKE47vkzbdh0BNCl918FK1F7UFWip5Cg6EsHEi1kWr+tC4KpyohHLI59BjGrBaZuxd82m1o1dlSGEdUlatZjE934IjK3gUKbE552qNkeou5R9jcmqdoEWXxGTcwQy8W/3cMTslkRXym+9gspNV3N6Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774862847; c=relaxed/simple;
	bh=Qbngn77JdyweWLsDY3IBnaFTiTzaPsOZMt+WqQwrXao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XuBfBtV3sMbwKDhH0XJTgP9iYhv7w44Mq5p3Ua0gJ0LuhCC+8KqC0GscAYNbx6+j9tmpHXpVdC/pyC3rdUrXwTGWXzJ6yELjw6w8y5SCikEhm0/ck71O3Q4SwKXUYRiO6y7Fg7RUWdDd/kijnl81YMUeqY+Y2fM7NEOEUpRHdVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AEXQYG57; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LiABGweA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U8Q70o2458515
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 09:27:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6lRyP2v+TyzHmUXjihsV/Pp6jzdERcDAdIA5S7gMZyE=; b=AEXQYG57WEYZW2wf
	nZgJJsWxwyt97vvvMl5Nf5OFkpgUeTOBseIXl7xXViKHkrC6LwE3ROcLOhywZnrD
	diiw0FMrnZO4rfgD3TChlSr+/Jt/Vz3V7jRYVRT6vfuN1BikF7tba1CkzytRg34V
	5fR4LYcdbrHfSDEQFJwHtEp0z/372irX761KzTpIu1HuySihq/oIZW1+MnmknH/w
	Szp6T/3iyZlpxO3nHdm92AGmsRyXqsBfVxQXCzz/g3k5LVML2n9vcHKYqDXXbSK6
	bIOeBGxtjriszBam6Kl7oOcQV3TqsII55Nzl5LaALQ5WC7tbL3LKbtsnQJ2odGk3
	RapqZA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7nnmr8qu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 09:27:24 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b24af7ca99so18118605ad.1
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 02:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774862844; x=1775467644; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6lRyP2v+TyzHmUXjihsV/Pp6jzdERcDAdIA5S7gMZyE=;
        b=LiABGweAOaIL9B/m4N0Se4qpk/VQTrjUTkXg+JkSq6sC680koLdsaR4/MhfpdctTIu
         h0xw4VDnXG5E2e7A/NEQr2NsoEWu6gaTFNPfJVxK7vDPvGvXNpSfzkSLf7iqrIWacT03
         D+boWEBYxlez3ZnSY8sygkLxGuqjikoPR4s7qOr7oRRme1LlDO+xw7mlr0UeWwLBc1OB
         v+cuz0Wvnl9F+pVJU29eO2NnqoidwZBPOKtRzLIGMglXMehnxVaH4oBwFy8FNXIi8hYB
         86g6eq2rQH9JDct7XLIvj7WfptFa17A0NbHwCrAh8J747s7XqMr69Hw581hVMgfZuTqr
         Uk5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774862844; x=1775467644;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6lRyP2v+TyzHmUXjihsV/Pp6jzdERcDAdIA5S7gMZyE=;
        b=XMr+wIRlRGbreQsutUYiXeSA1NZD5J+PO05Sr21HgDI88TmwtyNMNCvjW31oxwF3Tc
         3Kzpmsd+jtDOpHeTWROMtfDW0ShxUO2bKkC+xsJCNzXkAkOU7JX1Zvwlzdwmv4O+8Fjm
         4TANgZ4ibXKqIoRLPUcs2Q6t+u1zj8xaODr4slMpPOjQBhDLmfo7Zi7KJhCm8h0D7/4Q
         euFaW+I09th0gtblFf4fIz+bRSSsqGW6sc7FLAyJPJqxqnrq1krzeYztXOQMdrNKi1Sl
         i1iuztv+5QE+U6f73A5hXcyt/Pu0rxBOCOG4+ujfe7mtnbuacJZfaNCkC8obJRwSMD30
         cRmA==
X-Forwarded-Encrypted: i=1; AJvYcCV5zymYZVpcHCIZwA1s2EL48AqhUiOh+NCy9qlwvRrfo+9yTXb4XoJngNipqHvJBMw3DLp7YErrsnjV@vger.kernel.org
X-Gm-Message-State: AOJu0YxGcsk+T8y1OKOvnJpcFMrRhMWDMAPXMW2g5dE+LdgtnLzicKO6
	u2FSWwbI95Dy0/vDAqMyfUZGZKtKZV6ADVmqf86FN5hBd7RyCRT3OUqkV/KHK3TdZBG0fffbDxA
	KrR0f8/WiIpBl0TkiBE/VHpqQD+uNzD3HK3lmhcKlLIsP9nnZXvHE2625S+99ko+d
X-Gm-Gg: ATEYQzxDmU5fv/3LAkwXeHfQ5NB/koHpxi+eNtje0mD3/ZYMozivH5Uawfng3p1Qc4C
	SnVgurYdbnoNIMCPy8FoYGUHaxOswBcV7yEBvjGkvIMTqL21QVqRDTfZDX6bn+/dg2r6yi7rE4j
	YnJFIiCFvttXJ81IudAow3cms5JGdci9kmH2LG+b1V9AISJ9MaKL1gicWCPIFCF0DLo6zBcMsMc
	xweQqn9o6Chk0AJou20JzlgkuLfNycpOpGxuxLSE2RSlGEU5S4h0ECQc9P1OFXh1zlb+ubuPYm8
	BkLVBgpeeZeNgbsz2d/Uj+1vImgCGugxwbV1eHsbZPz6cSEjKSJE7w8SoVB16x+r/qBWauyZE06
	NUiBwWVoHp8voclK3xetRHMxDk3ll+7ZwoEHh2UVFMqeD4OHyHEqXRBzBNSp8v+MVRQ==
X-Received: by 2002:a17:902:ce8c:b0:2b0:a957:304 with SMTP id d9443c01a7336-2b0cdc22fc5mr126256995ad.6.1774862843802;
        Mon, 30 Mar 2026 02:27:23 -0700 (PDT)
X-Received: by 2002:a17:902:ce8c:b0:2b0:a957:304 with SMTP id d9443c01a7336-2b0cdc22fc5mr126256655ad.6.1774862843338;
        Mon, 30 Mar 2026 02:27:23 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242642913sm72585395ad.10.2026.03.30.02.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 02:27:22 -0700 (PDT)
Message-ID: <b8e920d2-78ee-47fe-b26c-709be4763dc5@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 14:57:18 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] pinctrl: qcom: Introduce IPQ5210 TLMM driver
To: Linus Walleij <linusw@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260330-ipq5210_tlmm-v4-0-b7c40c5429e5@oss.qualcomm.com>
 <20260330-ipq5210_tlmm-v4-2-b7c40c5429e5@oss.qualcomm.com>
 <CAD++jLnwqDgKJMEBomgGSt-Mo90Tp0Or0EdRx3MkhM9D9dj=4g@mail.gmail.com>
 <CAD++jLkp0AfxUqAHzjJjS8k_NcbHyT4qy=yPhUwbvAYXcAhdZw@mail.gmail.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <CAD++jLkp0AfxUqAHzjJjS8k_NcbHyT4qy=yPhUwbvAYXcAhdZw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA3MyBTYWx0ZWRfX61GH2X0Tegc0
 uOJVQjeqRG+GVYnn8MpA5VS1QGIYLvV4E47BzptnvUyOzv+QfgWUodFHVch7ODlHEuq+4Or0aA4
 bt+fUg1wEqG3s7HbDqVYqb/AM1YAUJJgv2MRB1QgrNtN/qMVp2vr/LB6QyE0B41aW/ZAOs5RHZF
 eGDmfs+tTt7FLsNEoVPjVd+BSwjmx6BY3/996ibutYJwV7PopAFJvRR+BqzEDnKukQVuksrcn+x
 Vnd7D2YcVyJ3TTlcFv7nn5hWsQQuRKT/b6+NQHvN/dljvFXlO4ObZD3JM/8OQcufJyz8jQ567sL
 7oxJISPxQKRABJ7CgJ+aJqxZsC0yTSSqb92S5gSc7LNEmVzymzGs+bPQ8gI+KzAObIXLiKzty0F
 vbqH1guTBzIytrnvpOQ3APP7j3ZTlq+6i4DMDGpkP6QSf1JoOh9cY3K5xHe+t70arRCDGz/ljpJ
 8tnwTA4RbPDBKwV6e1A==
X-Authority-Analysis: v=2.4 cv=M4FA6iws c=1 sm=1 tr=0 ts=69ca41fc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ucmReQScbumPMK653VEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: UAYTp-oPeDKUEiR967XWthsDPORfPr6_
X-Proofpoint-ORIG-GUID: UAYTp-oPeDKUEiR967XWthsDPORfPr6_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300073
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34422-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D0E503582BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/30/2026 2:19 PM, Linus Walleij wrote:
> On Mon, Mar 30, 2026 at 10:45 AM Linus Walleij <linusw@kernel.org> wrote:
>> right before merging this patch I merged:
>> https://lore.kernel.org/linux-gpio/20260327171240.3222755-2-mukesh.ojha@oss.qualcomm.com/
>>
>> On Mon, Mar 30, 2026 at 6:51 AM Kathiravan Thirumoorthy
>> <kathiravan.thirumoorthy@oss.qualcomm.com> wrote:
>>
>>> +               .intr_status_reg = 0xc + REG_SIZE * id,               \
>>> +               .intr_target_reg = 0x8 + REG_SIZE * id,               \
>> (...)
>>
>> Should intr_target_reg be dropped also from this driver?
>>
>> If so, please send a follow-up patch.
> After reading closer I can see it definitely should be dropped
> so I just augmented the patch.
>
> No need to do anything.

Hi Linus,

Thanks, I noticed the Mukesh's change and I thought I can send the 
follow-up patch. But thanks for taking care of this.

Thanks,

Kathiravan T.

>
> Yours,
> Linus Walleij

