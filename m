Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 988696EAC13
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Apr 2023 15:51:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232435AbjDUNvM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Apr 2023 09:51:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbjDUNvL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Apr 2023 09:51:11 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A57BBB4;
        Fri, 21 Apr 2023 06:51:09 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33LDafkQ018304;
        Fri, 21 Apr 2023 13:51:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ufPYrwynkUFNDvq2ZnUEtQ15eUnVW0pOptzWcGD5sro=;
 b=QZqEbIBF40tH6/xIZIYkC5xTx8y5aO9VhsOAVCURKPsV+wi21eVdgIaqxGptKNGrrCta
 AWa8mgq/tbX3SxUpsoYCw9PMVAZ78pnYW9RHcnb1iNIWA5rEcEzpapJEljv6aUwlG7ci
 Eg1+/7mMPdj8JP+AmnuvzRSAGlqWL0F65MYgo8RJE0KjlDq9G3+rW/Ixr3GBdbzj2+ID
 rIONp0gVOywq0cfveS7Ab6nbKG5/CkNpGtJ4nNMW9gWVk+jYqWafilemQ2AZ7jlwuU0W
 LWbEsze6AMrTQi+pqQUfgzj3W/ltBHr2H6WeRd+j5REy6K22tzDtC3YHGwCKwBz071Z9 zQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q3phdgpta-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 21 Apr 2023 13:51:05 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33LDp5M7012164
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 21 Apr 2023 13:51:05 GMT
Received: from [10.216.54.119] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 21 Apr
 2023 06:50:59 -0700
Message-ID: <d4f94878-6c0a-18ee-c1d7-18ae5b56db0c@quicinc.com>
Date:   Fri, 21 Apr 2023 19:20:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: qcom: Add SDX75 pinctrl
 devicetree compatible
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
CC:     <andersson@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <richardcochran@gmail.com>,
        <netdev@vger.kernel.org>, <linus.walleij@linaro.org>,
        <robh+dt@kernel.org>, <agross@kernel.org>,
        <linux-gpio@vger.kernel.org>, <manivannan.sadhasivam@linaro.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <konrad.dybcio@linaro.org>,
        <devicetree@vger.kernel.org>
References: <1682070196-980-1-git-send-email-quic_rohiagar@quicinc.com>
 <1682070196-980-2-git-send-email-quic_rohiagar@quicinc.com>
 <168208107990.922528.1582713033522143366.robh@kernel.org>
From:   Rohit Agarwal <quic_rohiagar@quicinc.com>
In-Reply-To: <168208107990.922528.1582713033522143366.robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: base64
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 993y20VGOhthLvpZqSFWrlvYMQhl57G3
X-Proofpoint-ORIG-GUID: 993y20VGOhthLvpZqSFWrlvYMQhl57G3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-21_06,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 phishscore=0 suspectscore=0 adultscore=0 mlxscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304210121
X-Spam-Status: No, score=-6.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiA0LzIxLzIwMjMgNjoyNiBQTSwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+IE9uIEZyaSwg
MjEgQXByIDIwMjMgMTU6MTM6MTUgKzA1MzAsIFJvaGl0IEFnYXJ3YWwgd3JvdGU6DQo+PiBB
ZGQgZGV2aWNlIHRyZWUgYmluZGluZyBEb2N1bWVudGF0aW9uIGRldGFpbHMgZm9yIFF1YWxj
b21tIFNEWDc1DQo+PiBwaW5jdHJsIGRyaXZlci4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBS
b2hpdCBBZ2Fyd2FsIDxxdWljX3JvaGlhZ2FyQHF1aWNpbmMuY29tPg0KPj4gLS0tDQo+PiAg
IC4uLi9iaW5kaW5ncy9waW5jdHJsL3Fjb20sc2R4NzUtdGxtbS55YW1sICAgICAgICAgIHwg
MTc3ICsrKysrKysrKysrKysrKysrKysrKw0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMTc3IGlu
c2VydGlvbnMoKykNCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3Fjb20sc2R4NzUtdGxtbS55YW1sDQo+Pg0KPiBN
eSBib3QgZm91bmQgZXJyb3JzIHJ1bm5pbmcgJ21ha2UgRFRfQ0hFQ0tFUl9GTEFHUz0tbSBk
dF9iaW5kaW5nX2NoZWNrJw0KPiBvbiB5b3VyIHBhdGNoIChEVF9DSEVDS0VSX0ZMQUdTIGlz
IG5ldyBpbiB2NS4xMyk6DQo+DQo+IHlhbWxsaW50IHdhcm5pbmdzL2Vycm9yczoNCj4gLi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9xY29tLHNkeDc1LXRs
bW0ueWFtbDo3Njo1MjogW3dhcm5pbmddIHRvbyBmZXcgc3BhY2VzIGFmdGVyIGNvbW1hIChj
b21tYXMpDQo+DQo+IGR0c2NoZW1hL2R0YyB3YXJuaW5ncy9lcnJvcnM6DQo+IC9idWlsZHMv
cm9iaGVycmluZy9kdC1yZXZpZXctY2kvbGludXgvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3BpbmN0cmwvcWNvbSxzZHg3NS10bG1tLmV4YW1wbGUuZHRiOiBwaW5jdHJs
QGYxMDAwMDA6IHVhcnQtdy1zdGF0ZTogJ29uZU9mJyBjb25kaXRpb25hbCBmYWlsZWQsIG9u
ZSBtdXN0IGJlIGZpeGVkOg0KPiAJJ2Z1bmN0aW9uJyBpcyBhIHJlcXVpcmVkIHByb3BlcnR5
DQo+IAkncGlucycgaXMgYSByZXF1aXJlZCBwcm9wZXJ0eQ0KPiAJJ3J4LXBpbnMnLCAndHgt
cGlucycgZG8gbm90IG1hdGNoIGFueSBvZiB0aGUgcmVnZXhlczogJ3BpbmN0cmwtWzAtOV0r
Jw0KPiAJJ3F1cF9zZTFfbDJfbWlyYScgaXMgbm90IG9uZSBvZiBbJ2dwaW8nLCAnZXRoMF9t
ZGMnLCAnZXRoMF9tZGlvJywgJ2V0aDFfbWRjJywgJ2V0aDFfbWRpbycsICdxbGluazBfd21z
c19yZXNldCcsICdxbGluazFfd21zc19yZXNldCcsICdyZ21paV9yeGMnLCAncmdtaWlfcnhk
MCcsICdyZ21paV9yeGQxJywgJ3JnbWlpX3J4ZDInLCAncmdtaWlfcnhkMycsICdyZ21paV9y
eF9jdGwnLCAncmdtaWlfdHhjJywgJ3JnbWlpX3R4ZDAnLCAncmdtaWlfdHhkMScsICdyZ21p
aV90eGQyJywgJ3JnbWlpX3R4ZDMnLCAncmdtaWlfdHhfY3RsJywgJ2Fkc3BfZXh0X3Zmcics
ICdhdGVzdF9jaGFyX3N0YXJ0JywgJ2F0ZXN0X2NoYXJfc3RhdHVzMCcsICdhdGVzdF9jaGFy
X3N0YXR1czEnLCAnYXRlc3RfY2hhcl9zdGF0dXMyJywgJ2F0ZXN0X2NoYXJfc3RhdHVzMycs
ICdhdWRpb19yZWZfY2xrJywgJ2JpbWNfZHRlX3Rlc3QwJywgJ2JpbWNfZHRlX3Rlc3QxJywg
J2NoYXJfZXhlY19wZW5kaW5nJywgJ2NoYXJfZXhlY19yZWxlYXNlJywgJ2NvZXhfdWFydDJf
cngnLCAnY29leF91YXJ0Ml90eCcsICdjb2V4X3VhcnRfcngnLCAnY29leF91YXJ0X3R4Jywg
J2NyaV90cm5nX3Jvc2MnLCAnY3JpX3Rybmdfcm9zYzAnLCAnY3JpX3Rybmdfcm9zYzEnLCAn
ZGJnX291dF9jbGsnLCAnZGRyX2Jpc3RfY29tcGxldGUnLCAnZGRyX2Jpc3RfZmFpbCcsICdk
ZHJfYmlzdF9zdGFydCcsICdkZHJfYmlzdF9zdG9wJywgJ2Rkcl9weGkwX3Rlc3QnLCAnZWJp
MF93cmNkY19kcTInLCAnZWJpMF93cmNkY19kcTMnLCAnZWJpMl9hX2QnLCAnZWJpMl9sY2Rf
Y3MnLCAnZWJpMl9sY2RfcmVzZXQnLCAnZWJpMl9sY2RfdGUnLCAnZW1hYzBfbWNnX3BzdDAn
LCAnZW1hYzBfbWNnX3BzdDEnLCAnZW1hYzBfbWNnX3BzdDInLCAnZW1hYzBfbWNnX3BzdDMn
LCAnZW1hYzBfcHRwX2F1eCcsICdlbWFjMF9wdHBfcHBzJywgJ2VtYWMxX21jZ19wc3QwJywg
J2VtYWMxX21jZ19wc3QxJywgJ2VtYWMxX21jZ19wc3QyJywgJ2VtYWMxX21jZ19wc3QzJywg
J2VtYWMxX3B0cF9hdXgwJywgJ2VtYWMxX3B0cF9hdXgxJywgJ2VtYWMxX3B0cF9hdXgyJywg
J2VtYWMxX3B0cF9hdXgzJywgJ2VtYWMxX3B0cF9wcHMwJywgJ2VtYWMxX3B0cF9wcHMxJywg
J2VtYWMxX3B0cF9wcHMyJywgJ2VtYWMxX3B0cF9wcHMzJywgJ2VtYWNfY2RjX2R0ZXN0MCcs
ICdlbWFjX2NkY19kdGVzdDEnLCAnZW1hY19wcHNfaW4nLCAnZXh0X2RiZ191YXJ0JywgJ2dj
Y18xMjVfY2xrJywgJ2djY19ncDFfY2xrJywgJ2djY19ncDJfY2xrJywgJ2djY19ncDNfY2xr
JywgJ2djY19wbGx0ZXN0X2J5cGFzc25sJywgJ2djY19wbGx0ZXN0X3Jlc2V0bicsICdpMnNf
bWNsaycsICdqaXR0ZXJfYmlzdF9yZWYnLCAnbGRvX2VuJywgJ2xkb191cGRhdGUnLCAnbV92
b2NfZXh0JywgJ21ncGlfY2xrX3JlcScsICduYXRpdmUwJywgJ25hdGl2ZTEnLCAnbmF0aXZl
MicsICduYXRpdmUzJywgJ25hdGl2ZV9jaGFyX3N0YXJ0JywgJ25hdGl2ZV90c2Vuc19vc2Mn
LCAnbmF0aXZlX3RzZW5zZV9wd20xJywgJ25hdl9kcl9zeW5jJywgJ25hdl9ncGlvXzAnLCAn
bmF2X2dwaW9fMScsICduYXZfZ3Bpb18yJywgJ25hdl9ncGlvXzMnLCAncGFfaW5kaWNhdG9y
XzEnLCAncGNpX2VfcnN0JywgJ3BjaWUwX2Nsa3JlcV9uJywgJ3BjaWUxX2Nsa3JlcV9uJywg
J3BjaWUyX2Nsa3JlcV9uJywgJ3BsbF9iaXN0X3N5bmMnLCAncGxsX2Nsa19hdXgnLCAncGxs
X3JlZl9jbGsnLCAncHJpX21pMnNfZGF0YTAnLCAncHJpX21pMnNfZGF0YTEnLCAncHJpX21p
MnNfc2NrJywgJ3ByaV9taTJzX3dzJywgJ3Bybmdfcm9zY190ZXN0MCcsICdwcm5nX3Jvc2Nf
dGVzdDEnLCAncHJuZ19yb3NjX3Rlc3QyJywgJ3Bybmdfcm9zY190ZXN0MycsICdxZHNzX2N0
aV90cmlnMCcsICdxZHNzX2N0aV90cmlnMScsICdxZHNzX2dwaW9fdHJhY2VjbGsnLCAncWRz
c19ncGlvX3RyYWNlY3RsJywgJ3Fkc3NfZ3Bpb190cmFjZWRhdGEwJywgJ3Fkc3NfZ3Bpb190
cmFjZWRhdGExJywgJ3Fkc3NfZ3Bpb190cmFjZWRhdGExMCcsICdxZHNzX2dwaW9fdHJhY2Vk
YXRhMTEnLCAncWRzc19ncGlvX3RyYWNlZGF0YTEyJywgJ3Fkc3NfZ3Bpb190cmFjZWRhdGEx
MycsICdxZHNzX2dwaW9fdHJhY2VkYXRhMTQnLCAncWRzc19ncGlvX3RyYWNlZGF0YTE1Jywg
J3Fkc3NfZ3Bpb190cmFjZWRhdGEyJywgJ3Fkc3NfZ3Bpb190cmFjZWRhdGEzJywgJ3Fkc3Nf
Z3Bpb190cmFjZWRhdGE0JywgJ3Fkc3NfZ3Bpb190cmFjZWRhdGE1JywgJ3Fkc3NfZ3Bpb190
cmFjZWRhdGE2JywgJ3Fkc3NfZ3Bpb190cmFjZWRhdGE3JywgJ3Fkc3NfZ3Bpb190cmFjZWRh
dGE4JywgJ3Fkc3NfZ3Bpb190cmFjZWRhdGE5JywgJ3FsaW5rMF9iX2VuJywgJ3FsaW5rMF9i
X3JlcScsICdxbGluazBfbF9lbicsICdxbGluazBfbF9yZXEnLCAncWxpbmsxX2xfZW4nLCAn
cWxpbmsxX2xfcmVxJywgJ3F1cF9zZTBfbDAnLCAncXVwX3NlMF9sMScsICdxdXBfc2UwX2wy
JywgJ3F1cF9zZTBfbDMnLCAncXVwX3NlMV9sMicsICdxdXBfc2UxX2wzJywgJ3F1cF9zZTJf
bDAnLCAncXVwX3NlMl9sMScsICdxdXBfc2UyX2wyJywgJ3F1cF9zZTJfbDMnLCAncXVwX3Nl
M19sMCcsICdxdXBfc2UzX2wxJywgJ3F1cF9zZTNfbDInLCAncXVwX3NlM19sMycsICdxdXBf
c2U0X2wyJywgJ3F1cF9zZTRfbDMnLCAncXVwX3NlNV9sMCcsICdxdXBfc2U1X2wxJywgJ3F1
cF9zZTZfbDAnLCAncXVwX3NlNl9sMScsICdxdXBfc2U2X2wyJywgJ3F1cF9zZTZfbDMnLCAn
cXVwX3NlN19sMCcsICdxdXBfc2U3X2wxJywgJ3F1cF9zZTdfbDInLCAncXVwX3NlN19sMycs
ICdxdXBfc2U4X2wyJywgJ3F1cF9zZThfbDMnLCAnc2RjMV90Yl90cmlnJywgJ3NkYzJfdGJf
dHJpZycsICdzZWNfbWkyc19kYXRhMCcsICdzZWNfbWkyc19kYXRhMScsICdzZWNfbWkyc19z
Y2snLCAnc2VjX21pMnNfd3MnLCAnc2dtaWlfcGh5X2ludHIwJywgJ3NnbWlpX3BoeV9pbnRy
MScsICdzcG1pX2NvZXhfY2xrJywgJ3NwbWlfY29leF9kYXRhJywgJ3NwbWlfdmdpX2h3ZXZl
bnQnLCAndGd1X2NoMF90cmlnb3V0JywgJ3RyaV9taTJzX2RhdGEwJywgJ3RyaV9taTJzX2Rh
dGExJywgJ3RyaV9taTJzX3NjaycsICd0cmlfbWkyc193cycsICd1aW0xX2NsaycsICd1aW0x
X2RhdGEnLCAndWltMV9wcmVzZW50JywgJ3VpbTFfcmVzZXQnLCAndWltMl9jbGsnLCAndWlt
Ml9kYXRhJywgJ3VpbTJfcHJlc2VudCcsICd1aW0yX3Jlc2V0JywgJ3VzYjJwaHlfYWNfZW4n
LCAndnNlbnNlX3RyaWdnZXJfbWlybmF0J10NCj4gCSdxdXBfc2UxX2wzX21pcmEnIGlzIG5v
dCBvbmUgb2YgWydncGlvJywgJ2V0aDBfbWRjJywgJ2V0aDBfbWRpbycsICdldGgxX21kYycs
ICdldGgxX21kaW8nLCAncWxpbmswX3dtc3NfcmVzZXQnLCAncWxpbmsxX3dtc3NfcmVzZXQn
LCAncmdtaWlfcnhjJywgJ3JnbWlpX3J4ZDAnLCAncmdtaWlfcnhkMScsICdyZ21paV9yeGQy
JywgJ3JnbWlpX3J4ZDMnLCAncmdtaWlfcnhfY3RsJywgJ3JnbWlpX3R4YycsICdyZ21paV90
eGQwJywgJ3JnbWlpX3R4ZDEnLCAncmdtaWlfdHhkMicsICdyZ21paV90eGQzJywgJ3JnbWlp
X3R4X2N0bCcsICdhZHNwX2V4dF92ZnInLCAnYXRlc3RfY2hhcl9zdGFydCcsICdhdGVzdF9j
aGFyX3N0YXR1czAnLCAnYXRlc3RfY2hhcl9zdGF0dXMxJywgJ2F0ZXN0X2NoYXJfc3RhdHVz
MicsICdhdGVzdF9jaGFyX3N0YXR1czMnLCAnYXVkaW9fcmVmX2NsaycsICdiaW1jX2R0ZV90
ZXN0MCcsICdiaW1jX2R0ZV90ZXN0MScsICdjaGFyX2V4ZWNfcGVuZGluZycsICdjaGFyX2V4
ZWNfcmVsZWFzZScsICdjb2V4X3VhcnQyX3J4JywgJ2NvZXhfdWFydDJfdHgnLCAnY29leF91
YXJ0X3J4JywgJ2NvZXhfdWFydF90eCcsICdjcmlfdHJuZ19yb3NjJywgJ2NyaV90cm5nX3Jv
c2MwJywgJ2NyaV90cm5nX3Jvc2MxJywgJ2RiZ19vdXRfY2xrJywgJ2Rkcl9iaXN0X2NvbXBs
ZXRlJywgJ2Rkcl9iaXN0X2ZhaWwnLCAnZGRyX2Jpc3Rfc3RhcnQnLCAnZGRyX2Jpc3Rfc3Rv
cCcsICdkZHJfcHhpMF90ZXN0JywgJ2ViaTBfd3JjZGNfZHEyJywgJ2ViaTBfd3JjZGNfZHEz
JywgJ2ViaTJfYV9kJywgJ2ViaTJfbGNkX2NzJywgJ2ViaTJfbGNkX3Jlc2V0JywgJ2ViaTJf
bGNkX3RlJywgJ2VtYWMwX21jZ19wc3QwJywgJ2VtYWMwX21jZ19wc3QxJywgJ2VtYWMwX21j
Z19wc3QyJywgJ2VtYWMwX21jZ19wc3QzJywgJ2VtYWMwX3B0cF9hdXgnLCAnZW1hYzBfcHRw
X3BwcycsICdlbWFjMV9tY2dfcHN0MCcsICdlbWFjMV9tY2dfcHN0MScsICdlbWFjMV9tY2df
cHN0MicsICdlbWFjMV9tY2dfcHN0MycsICdlbWFjMV9wdHBfYXV4MCcsICdlbWFjMV9wdHBf
YXV4MScsICdlbWFjMV9wdHBfYXV4MicsICdlbWFjMV9wdHBfYXV4MycsICdlbWFjMV9wdHBf
cHBzMCcsICdlbWFjMV9wdHBfcHBzMScsICdlbWFjMV9wdHBfcHBzMicsICdlbWFjMV9wdHBf
cHBzMycsICdlbWFjX2NkY19kdGVzdDAnLCAnZW1hY19jZGNfZHRlc3QxJywgJ2VtYWNfcHBz
X2luJywgJ2V4dF9kYmdfdWFydCcsICdnY2NfMTI1X2NsaycsICdnY2NfZ3AxX2NsaycsICdn
Y2NfZ3AyX2NsaycsICdnY2NfZ3AzX2NsaycsICdnY2NfcGxsdGVzdF9ieXBhc3NubCcsICdn
Y2NfcGxsdGVzdF9yZXNldG4nLCAnaTJzX21jbGsnLCAnaml0dGVyX2Jpc3RfcmVmJywgJ2xk
b19lbicsICdsZG9fdXBkYXRlJywgJ21fdm9jX2V4dCcsICdtZ3BpX2Nsa19yZXEnLCAnbmF0
aXZlMCcsICduYXRpdmUxJywgJ25hdGl2ZTInLCAnbmF0aXZlMycsICduYXRpdmVfY2hhcl9z
dGFydCcsICduYXRpdmVfdHNlbnNfb3NjJywgJ25hdGl2ZV90c2Vuc2VfcHdtMScsICduYXZf
ZHJfc3luYycsICduYXZfZ3Bpb18wJywgJ25hdl9ncGlvXzEnLCAnbmF2X2dwaW9fMicsICdu
YXZfZ3Bpb18zJywgJ3BhX2luZGljYXRvcl8xJywgJ3BjaV9lX3JzdCcsICdwY2llMF9jbGty
ZXFfbicsICdwY2llMV9jbGtyZXFfbicsICdwY2llMl9jbGtyZXFfbicsICdwbGxfYmlzdF9z
eW5jJywgJ3BsbF9jbGtfYXV4JywgJ3BsbF9yZWZfY2xrJywgJ3ByaV9taTJzX2RhdGEwJywg
J3ByaV9taTJzX2RhdGExJywgJ3ByaV9taTJzX3NjaycsICdwcmlfbWkyc193cycsICdwcm5n
X3Jvc2NfdGVzdDAnLCAncHJuZ19yb3NjX3Rlc3QxJywgJ3Bybmdfcm9zY190ZXN0MicsICdw
cm5nX3Jvc2NfdGVzdDMnLCAncWRzc19jdGlfdHJpZzAnLCAncWRzc19jdGlfdHJpZzEnLCAn
cWRzc19ncGlvX3RyYWNlY2xrJywgJ3Fkc3NfZ3Bpb190cmFjZWN0bCcsICdxZHNzX2dwaW9f
dHJhY2VkYXRhMCcsICdxZHNzX2dwaW9fdHJhY2VkYXRhMScsICdxZHNzX2dwaW9fdHJhY2Vk
YXRhMTAnLCAncWRzc19ncGlvX3RyYWNlZGF0YTExJywgJ3Fkc3NfZ3Bpb190cmFjZWRhdGEx
MicsICdxZHNzX2dwaW9fdHJhY2VkYXRhMTMnLCAncWRzc19ncGlvX3RyYWNlZGF0YTE0Jywg
J3Fkc3NfZ3Bpb190cmFjZWRhdGExNScsICdxZHNzX2dwaW9fdHJhY2VkYXRhMicsICdxZHNz
X2dwaW9fdHJhY2VkYXRhMycsICdxZHNzX2dwaW9fdHJhY2VkYXRhNCcsICdxZHNzX2dwaW9f
dHJhY2VkYXRhNScsICdxZHNzX2dwaW9fdHJhY2VkYXRhNicsICdxZHNzX2dwaW9fdHJhY2Vk
YXRhNycsICdxZHNzX2dwaW9fdHJhY2VkYXRhOCcsICdxZHNzX2dwaW9fdHJhY2VkYXRhOScs
ICdxbGluazBfYl9lbicsICdxbGluazBfYl9yZXEnLCAncWxpbmswX2xfZW4nLCAncWxpbmsw
X2xfcmVxJywgJ3FsaW5rMV9sX2VuJywgJ3FsaW5rMV9sX3JlcScsICdxdXBfc2UwX2wwJywg
J3F1cF9zZTBfbDEnLCAncXVwX3NlMF9sMicsICdxdXBfc2UwX2wzJywgJ3F1cF9zZTFfbDIn
LCAncXVwX3NlMV9sMycsICdxdXBfc2UyX2wwJywgJ3F1cF9zZTJfbDEnLCAncXVwX3NlMl9s
MicsICdxdXBfc2UyX2wzJywgJ3F1cF9zZTNfbDAnLCAncXVwX3NlM19sMScsICdxdXBfc2Uz
X2wyJywgJ3F1cF9zZTNfbDMnLCAncXVwX3NlNF9sMicsICdxdXBfc2U0X2wzJywgJ3F1cF9z
ZTVfbDAnLCAncXVwX3NlNV9sMScsICdxdXBfc2U2X2wwJywgJ3F1cF9zZTZfbDEnLCAncXVw
X3NlNl9sMicsICdxdXBfc2U2X2wzJywgJ3F1cF9zZTdfbDAnLCAncXVwX3NlN19sMScsICdx
dXBfc2U3X2wyJywgJ3F1cF9zZTdfbDMnLCAncXVwX3NlOF9sMicsICdxdXBfc2U4X2wzJywg
J3NkYzFfdGJfdHJpZycsICdzZGMyX3RiX3RyaWcnLCAnc2VjX21pMnNfZGF0YTAnLCAnc2Vj
X21pMnNfZGF0YTEnLCAnc2VjX21pMnNfc2NrJywgJ3NlY19taTJzX3dzJywgJ3NnbWlpX3Bo
eV9pbnRyMCcsICdzZ21paV9waHlfaW50cjEnLCAnc3BtaV9jb2V4X2NsaycsICdzcG1pX2Nv
ZXhfZGF0YScsICdzcG1pX3ZnaV9od2V2ZW50JywgJ3RndV9jaDBfdHJpZ291dCcsICd0cmlf
bWkyc19kYXRhMCcsICd0cmlfbWkyc19kYXRhMScsICd0cmlfbWkyc19zY2snLCAndHJpX21p
MnNfd3MnLCAndWltMV9jbGsnLCAndWltMV9kYXRhJywgJ3VpbTFfcHJlc2VudCcsICd1aW0x
X3Jlc2V0JywgJ3VpbTJfY2xrJywgJ3VpbTJfZGF0YScsICd1aW0yX3ByZXNlbnQnLCAndWlt
Ml9yZXNldCcsICd1c2IycGh5X2FjX2VuJywgJ3ZzZW5zZV90cmlnZ2VyX21pcm5hdCddDQo+
IAlGcm9tIHNjaGVtYTogL2J1aWxkcy9yb2JoZXJyaW5nL2R0LXJldmlldy1jaS9saW51eC9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9xY29tLHNkeDc1LXRs
bW0ueWFtbA0KPg0KPiBkb2MgcmVmZXJlbmNlIGVycm9ycyAobWFrZSByZWZjaGVja2RvY3Mp
Og0KPg0KPiBTZWUgaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2Rldmlj
ZXRyZWUtYmluZGluZ3MvcGF0Y2gvMTY4MjA3MDE5Ni05ODAtMi1naXQtc2VuZC1lbWFpbC1x
dWljX3JvaGlhZ2FyQHF1aWNpbmMuY29tDQo+DQo+IFRoZSBiYXNlIGZvciB0aGUgc2VyaWVz
IGlzIGdlbmVyYWxseSB0aGUgbGF0ZXN0IHJjMS4gQSBkaWZmZXJlbnQgZGVwZW5kZW5jeQ0K
PiBzaG91bGQgYmUgbm90ZWQgaW4gKnRoaXMqIHBhdGNoLg0KPg0KPiBJZiB5b3UgYWxyZWFk
eSByYW4gJ21ha2UgZHRfYmluZGluZ19jaGVjaycgYW5kIGRpZG4ndCBzZWUgdGhlIGFib3Zl
DQo+IGVycm9yKHMpLCB0aGVuIG1ha2Ugc3VyZSAneWFtbGxpbnQnIGlzIGluc3RhbGxlZCBh
bmQgZHQtc2NoZW1hIGlzIHVwIHRvDQo+IGRhdGU6DQo+DQo+IHBpcDMgaW5zdGFsbCBkdHNj
aGVtYSAtLXVwZ3JhZGUNCj4NCj4gUGxlYXNlIGNoZWNrIGFuZCByZS1zdWJtaXQgYWZ0ZXIg
cnVubmluZyB0aGUgYWJvdmUgY29tbWFuZCB5b3Vyc2VsZi4gTm90ZQ0KPiB0aGF0IERUX1ND
SEVNQV9GSUxFUyBjYW4gYmUgc2V0IHRvIHlvdXIgc2NoZW1hIGZpbGUgdG8gc3BlZWQgdXAg
Y2hlY2tpbmcNCj4geW91ciBzY2hlbWEuIEhvd2V2ZXIsIGl0IG11c3QgYmUgdW5zZXQgdG8g
dGVzdCBhbGwgZXhhbXBsZXMgd2l0aCB5b3VyIHNjaGVtYS4NCk1ha2UgZHRfYmluZGluZ19j
aGVjayBub3QgdGhyb3dpbmcgdGhpcyBlcnJvciBldmVuIGFmdGVyIHVwZGF0aW5nIHRoZSAN
CmR0c2NoZW1hIGFuZCB5YW1sbGludCBpcyBpbnN0YWxsZWQuDQpXaWxsIHVwZGF0ZSB0aGlz
IGluIHBhdGNoc2V0IDQuIFdpbGwgd2FpdCBmb3IgY29tbWVudHMgb24gZHJpdmVyIGNoYW5n
ZSwgDQpJZiB0aGVyZSBhcmUgYW55IHdpbGwgcHVzaCB0aGUgcGF0Y2hzZXQgNA0KYWRkcmVz
c2luZyB0aG9zZSBjb21tZW50cyBhdCBvbmNlLg0KDQpUaGFua3MNClJvaGl0Lg0K
