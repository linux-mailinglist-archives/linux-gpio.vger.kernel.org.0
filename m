Return-Path: <linux-gpio+bounces-33334-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aO3YNR3js2ktcQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33334-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 11:12:45 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0072813B0
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 11:12:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DA5AC301A9F9
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 10:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5855138C40B;
	Fri, 13 Mar 2026 10:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MFGh3MtZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BkkDFQCk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91A938657C
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 10:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773396761; cv=none; b=J1Bs5EmoSW9qBCncvJiqsiRytpDbOiDPXqb4DWjbWVtkEQn7RlpsTUjh46818gXaKaru6jb+8oRaUJQB+4iM2EzemA48XXAoVZqmnWyuVthN6yF71GDGpRW3YH0IUsN4iUBBK91qiwqOzoBeBWNssEsxtnfca2Tm6PWCB8Nk1tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773396761; c=relaxed/simple;
	bh=B172fkYW7Adv6DaHXie+bx7lUl2FGfQKcSP2Mk55elw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nqXFB6Vg+/msaf0GN0U1TMNrukhHkLgMtGs/xeSwikqBeAw0pUbwIk7L5nHeJDr2wYTyALxfHK6k7j8FzptTMYi3CVwWR/AmSEgPbtb2Npas/jIfIbk0Iesg/AgyirWpfDS9ZIJKeIpXtXDLBPCC3+7vHjT582YwvhQqDYfv4/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MFGh3MtZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BkkDFQCk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DA7pxs1749162
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 10:12:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9BbEuZS7Ng2OaOV9gLRRvHCkVS3SerYmz9AJm+sIdhk=; b=MFGh3MtZW5t215rV
	Y0EmGFw5oxojVseyXu/dAGoHih85aN5vbieKbldHEU9ewd9OEMje8z61kQQ73g8o
	99nG0CMRiYeD6GEngWVpqciV5s019zj21HCHszAC7VCznpcB6KIl6DGHqDz5Ua9j
	T3lVBB/3Ksv6iCmJfWVX+BdwucJb6RXgGYTkJRiXO3Xe+GN8FchCQQKghQ8oNE4r
	CK5RI8wq1J2ExUxm916HkrpUAuXcanjiARqeHRT935+uSzbuhHCEzSRMpxvzAKUJ
	Yp8XKZsN8eo6Q66GjUDPtjrmpyc0n/hHXvM+fL5c8FuI83A30mG+l5zt7F66kWDj
	vQ5z6w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvgj6g0k7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 10:12:38 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-358e425c261so2246030a91.3
        for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 03:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773396758; x=1774001558; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9BbEuZS7Ng2OaOV9gLRRvHCkVS3SerYmz9AJm+sIdhk=;
        b=BkkDFQCknUY8K/x1yfgumVQLjnXpY9cTg0+zNMue438XLGYEC1b1t9uM2Dftx+toUk
         FUJVYf8MBL9aHdDFNgaIE9jmExglbb0atcLFknRj9ONG5Ro8+BhTrd7EkNuposmyi1Mo
         rG8MZUhPIJ32fGBxc44aeaUQWTNq79Y/dSY/lQj5VlUjvxJ2YcBeUZMF77LChWOJY9WE
         mMlzrbDsXrtW++mNZmRo0KChtO2fxZUww2OINLLHx7HZuVACFbOp6qWXeq+XWXzXf1Xv
         GeRprk2EnmuYRdISV6GnlxruK5yPOl6yKdMzjxDA17WgT6mVzxgDHdBKk1HxIiQ+5+9U
         Aglw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773396758; x=1774001558;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9BbEuZS7Ng2OaOV9gLRRvHCkVS3SerYmz9AJm+sIdhk=;
        b=c7krKu6sPpZ5OeTDgIJvJ44Ojj0Wt4ngXX5BnDExgoFh4ABuad2sgXgSQ84Ce9MphS
         fzhFt3nVJR8PeWDxLm4rODQ6xy2DDxTuf+NTmQgOgYIf6w4ABWrDM/qlQYznw4leSx+f
         Vo3U9E8RzI/0aqQoYUNIOFLZpj80fcOEhn8iuT54koZhgda0oNcyzQt++19/zcVdzQgm
         foEck+IE/RBEO/LoeXHQ8ouDCzc5g25ysRQ76GGNKbZVqVgyq6DzQAAEepxOeMD290ad
         eN4U0Dzfw0UmyeyfqglIvBNOtmrvNlYB62azAw0l84Q3Ix4+xxipRsLHxEpaYUXH3v0R
         s5/g==
X-Forwarded-Encrypted: i=1; AJvYcCVA8BGTrn5xBYKLcIaGySIvhodQmdGv93xZ5Z3qv02ErPpR+f832kIogWm94TbC4I3TimFxsnc6Qze3@vger.kernel.org
X-Gm-Message-State: AOJu0YyPuoMSQ3rSDjlpBoilCmpCvGZ9dbIFOhujSao1OgewbicowNGN
	wvC5tnZA7QKipk4/nE6Pr3Yftv2OD4bIiLs7mYWB4K71Ff2EgTsI3UusokLHF0H35v2AANevYZS
	c3saCKRbrArqbNWe8+fFMecbqxVCrTuddOtq9AeiPcHL9xfCP9HayKqWH0BfhJ5gd
X-Gm-Gg: ATEYQzyURZvfWMuPJzuDarnk2OCT6SBCvq4qotEJXYgPRBctMUyK3GWq/O3Vv+WJ2tJ
	P+e3CjBn82QqxNiNupwN2vwKp1pWz0GMwq2j0ErWiSDcvzozZn2pzz1TKHzWIN7iPP9X2HUZV5m
	ldw8cJVagWUZ/0GeYX4gXx7U3wkmRwtGOzi5T2WXHCAipAp04+q40IVlFveGcKCStrtYvJzfEAs
	22T71WmkXrjGzE4iEDPP4UH8hrpwRA+09hgvmyLTcfNdUnIK1gm4S1pMh7h3VN2TQpj7vL8mmRh
	yAloP9PYAG0S7ECFcbdanA3LE3JukxSJbHPTwZ6fR0T8+olFLVi2tpL0duP8WxHHGx5OBNB5zFd
	AUs6FsqonLeI2vNsHz6XUOIR4wTUiRsHCPbfo7f5UTox+SDUN/GE=
X-Received: by 2002:a05:6a21:138e:b0:398:bcee:4519 with SMTP id adf61e73a8af0-398ecd1c731mr2379347637.41.1773396758371;
        Fri, 13 Mar 2026 03:12:38 -0700 (PDT)
X-Received: by 2002:a05:6a21:138e:b0:398:bcee:4519 with SMTP id adf61e73a8af0-398ecd1c731mr2379301637.41.1773396757828;
        Fri, 13 Mar 2026 03:12:37 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73ebb96df8sm1680756a12.33.2026.03.13.03.12.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 03:12:37 -0700 (PDT)
Message-ID: <198ccf60-a4b9-438b-ad92-bc4d2cc84b83@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 15:42:32 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] arm64: dts: qcom: x1e80100: Remove interconnect from
 SCM device
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260312-hamoa_pdc-v1-0-760c8593ce50@oss.qualcomm.com>
 <20260312-hamoa_pdc-v1-1-760c8593ce50@oss.qualcomm.com>
 <bnaxwhrfeer3n62xp5rka4pq4mz6y5xxwsin2vavc5zcj3ymxj@splrj22ki445>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <bnaxwhrfeer3n62xp5rka4pq4mz6y5xxwsin2vavc5zcj3ymxj@splrj22ki445>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA3OSBTYWx0ZWRfX29JVOnjKXFlv
 tDBaUyb+GzSfBDUxw8MQWFDw3HqffhJBxPn1DhbYrrb9gw9gzC17AiHm35wDxZP6tC8YuxXrxcG
 rV4HrWhgakX6yevMtEKxFAuSPC5NNCQkqsOvnwXO494euuyKsmtfhBHCesZBizBMXw2o2OSM2i3
 QUATfTHxhQQwrGsHq53CJKnqww0i8zUH820aj0dusP6f+Mt709S59KTE/FWPzcRHSJHpdVW0Uw9
 qH/8xU8k5L3m/qUwbhuqo8UCx1EDonALEb1Wlr86DPnCQA8jbkmrhb/h3zEoIsbdgx0cUF+LgOu
 JoY5YFiEdMLSj2gWbSwf36TJbJP2lcSm+3hOCX9RzJ2HmkJAOD00WP9DxENWljrWpBM/qsCfcUE
 HI9lhb3dMRKtloi2G+oETFWAP/RWXHW8thtD9WWEtO7XKFQ6dJi3bQSN/L7YAuYxJQ6/e1oBn1T
 R7RNW5wwWO6Ri/nGiUw==
X-Proofpoint-GUID: l3e9JqoA7j4XpkGQqmY_MDDq4DNjFC7T
X-Proofpoint-ORIG-GUID: l3e9JqoA7j4XpkGQqmY_MDDq4DNjFC7T
X-Authority-Analysis: v=2.4 cv=H+vWAuYi c=1 sm=1 tr=0 ts=69b3e317 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=j6RlDNsNG3S5HfLooScA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130079
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-33334-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7A0072813B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/13/2026 7:41 AM, Dmitry Baryshkov wrote:
> On Thu, Mar 12, 2026 at 09:26:35PM +0530, Maulik Shah wrote:
>> Interconnect from SCM device are optional and were added to get
>> additional performance benefit. These nodes however delays the
>> SCM firmware device probe due to dependency on interconnect and
>> results in NULL pointer dereference for the users of SCM device
>> driver APIs, such as PDC driver.
> 
> This sounds like a bug in the PDC driver. It should reject being probed
> before SCM is available.

The SCM driver provides no way to check if its ready or not to decide to reject/defer the probe.
A new API like below would be needed here,

int qcom_scm_ready(void)
{
        if (__scm == NULL || __scm->dev == NULL)
                return -EPROBE_DEFER;
        return 0;
}
EXPORT_SYMBOL_GPL(qcom_scm_ready);

This is inline with what cmd-db does today with cmd_db_ready() API.
(drivers/soc/qcom/cmd-db.c).

> 
>>
>> Remove them from the scm device to unblock the user.
>>
>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> index d7596ccf63b90a8a002ad6e77c0fb2c1b32ec9c8..ebecf43e0d462c431540257e299e3ace054901fd 100644
>> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> @@ -308,8 +308,7 @@ eud_in: endpoint {
>>  	firmware {
>>  		scm: scm {
>>  			compatible = "qcom,scm-x1e80100", "qcom,scm";
>> -			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
>> -					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>> +			/* TODO: add interconnects */
> 
> Somebody will try to fix this TODO, reverting this patch. Let's find a
> better way to handle it (which would also fit other platforms).
> Originaly this was proposed by Sibi ([1]) to speed up PAS
> authentication. Other platforms require RPM or GCC clocks to let the
> firmware access crypto core.
> 
> One of the (stupid) ideas would be to add a separate SCM (child?) device
> which would be used for crypto-related SCM calls. I'd like to point out
> that currently we bump those clocks or NoC bandwidth, but at the same
> time we don't vote on the CX rail. I'm not sure of the firmware handles
> that somehow or not.

Nice catch, AFAIK firmware don't handle voting for CX rail during SCM call.

> 
> [1] https://lore.kernel.org/all/1653289258-17699-1-git-send-email-quic_sibis@quicinc.com/

yes, I had already seen this,

So remoteproc PAS driver gets performance benefit with crypto vote and interesting choice was
made to place it from SCM driver. It was evaluated and considered reasonable one at that time,
pasting from [2],
The clocking needs for the CE relates to the SCM and not the remoteproc, and it's in line with
the management of CE clocks from the SCM driver.

With my limited understanding of remoteproc, SCM and crypto,

- A crypto vote would no way bump up the performance of CPU jumping from/to non-secure and secure world.
  (actual "path" of SCM driver).

  if remoteproc requires the crypto vote for image validation/authentication then remoteproc should
  place the vote for crypto path before invoking SCM APIs, SCM don't really use this vote for itself.
  SCM driver though today adds/removes vote within remoteproc APIs keeping vote placement limited
  to remoteproc usage only.

- Firmware could have put the crypto vote if firmware is doing image validation/authentication
  after the SCM call lands in firmware and remove it before returning to non-secure world.
  clearly not a choice now to update firmware.

- I see crypto device too places same vote (at least on x1e) so i must be missing something and
  both SCM and crypto device vote are needed here. I was thinking if remoteproc should route the
  SCM call via crypto driver (which would places the required crypto vote) and crypto driver
  should then invoke the crypto related SMC calls.

  crypto: crypto@1dfa000 {
  	compatible = "qcom,x1e80100-qce", "qcom,sm8150-qce", "qcom,qce";
	..
        interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
                        &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
  };

Let me know any preferences from below options or any other.

a) Add the API like qcom_scm_ready(), this has been tested and works fine.
b) Move interconnects from SCM to remoteproc PAS driver for all devices
   Take the vote before invoking SCM API and release after return.
c) Remove the interconnects from SCM and rely on crypto driver already
   placing the vote, Route the remote proc to SCM call via crypto API,
   This would ensure crpyto is being used and it would have placed the required vote.
d) Add separate SCM child device (with interconnects) under SoC.

[2] https://lore.kernel.org/all/Yr0Os5TOITY7f0Wk@builder.lan/

Thanks,
Maulik

