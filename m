Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A498F366A2
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2019 23:18:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbfFEVR4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Jun 2019 17:17:56 -0400
Received: from mail-eopbgr790059.outbound.protection.outlook.com ([40.107.79.59]:2512
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726554AbfFEVRz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 5 Jun 2019 17:17:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=micron.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6Zhdr1Kn/YAwbuIZrv7cOH5SdjRclBqEpShpueDq0c=;
 b=CdVn2rxOqf/JonUFGechxkMr9ga+/KcyXvxjah7aLidhkBsOydVkntx27mGxFdQm03yVFzMG5xGrysWACVOH9yRBx/kQ+uXZlo0IdspvyAhkWlJh05dRiBtBo8eGomRRaeuwwvr0DMAefnzLwMOTWabGmjoIJCsLssRMW01oxdE=
Received: from BN7PR08MB5684.namprd08.prod.outlook.com (20.176.31.141) by
 BN7PR08MB3843.namprd08.prod.outlook.com (52.132.5.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Wed, 5 Jun 2019 21:17:48 +0000
Received: from BN7PR08MB5684.namprd08.prod.outlook.com
 ([fe80::8d6c:f350:4859:e532]) by BN7PR08MB5684.namprd08.prod.outlook.com
 ([fe80::8d6c:f350:4859:e532%4]) with mapi id 15.20.1943.018; Wed, 5 Jun 2019
 21:17:48 +0000
From:   "Bean Huo (beanhuo)" <beanhuo@micron.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Pedro Sousa <pedrom.sousa@synopsys.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
Subject: RE: [EXT] [PATCH 2/3] scsi: ufs: Allow resetting the UFS device
Thread-Topic: [EXT] [PATCH 2/3] scsi: ufs: Allow resetting the UFS device
Thread-Index: AQHVGqX7mZWyymp0D0+pRLZPzmjhVqaLH8wwgAD1HYCAAXihMA==
Date:   Wed, 5 Jun 2019 21:17:48 +0000
Message-ID: <BN7PR08MB5684B63CABF148C279FD64C1DB160@BN7PR08MB5684.namprd08.prod.outlook.com>
References: <20190604072001.9288-1-bjorn.andersson@linaro.org>
 <20190604072001.9288-3-bjorn.andersson@linaro.org>
 <BN7PR08MB568450B1EC51ABAA2E426AC0DB150@BN7PR08MB5684.namprd08.prod.outlook.com>
 <20190604223025.GD4814@minitux>
In-Reply-To: <20190604223025.GD4814@minitux>
Accept-Language: en-150, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=beanhuo@micron.com; 
x-originating-ip: [165.225.81.60]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4414cfc2-6c39-416b-dbfb-08d6e9fb42c1
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:BN7PR08MB3843;
x-ms-traffictypediagnostic: BN7PR08MB3843:|BN7PR08MB3843:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN7PR08MB38438D51443799382393E3E8DB160@BN7PR08MB3843.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(396003)(376002)(136003)(39860400002)(346002)(199004)(189003)(7696005)(54906003)(55236004)(71190400001)(76176011)(11346002)(6506007)(14454004)(476003)(9686003)(6436002)(2906002)(76116006)(26005)(6916009)(25786009)(71200400001)(53936002)(99286004)(7416002)(229853002)(14444005)(52536014)(81156014)(4326008)(486006)(68736007)(55016002)(66476007)(66066001)(66556008)(66446008)(74316002)(5660300002)(45080400002)(446003)(478600001)(6246003)(256004)(6116002)(86362001)(8676002)(33656002)(5024004)(6306002)(186003)(102836004)(7736002)(8936002)(316002)(305945005)(81166006)(3846002)(73956011)(66946007)(64756008);DIR:OUT;SFP:1101;SCL:1;SRVR:BN7PR08MB3843;H:BN7PR08MB5684.namprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: micron.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bB0RHptXoY0oN9gfNYpsrwZhlAj/DQvFYUapaXM0Wiztqn7J8GnbHjmFn5ukYsG0t5k8hxl6As7reDo9/Z5KmOlC2M//V0HxktAKzKki1iKF+DqPt2uOSsUvJWCoH+Sf21u1Sff5wDKuZu7fZWYc3W4r3OuehOyNE2oE8yDk+866uDBpvhYIgmguS+Xfg9jS581nCHmogupbw9QKMJ/tiCqore70uXL+77zbdMPH1iBiuxISaFHTFocEg/+jhMBi3kPbbiO/io+XSWgC1n8x/Yfc7uVRZpwHnzOqRMyhClTN6I8VVvooTIVPyAZUfqqod2EKiOUdBB0qd434Dq8IL8+OXvGvW8OXkqgAeD3CtUdIYPky3T1Iftj3L4RO+KRU0KDlkj2CofXleI+ktelCPCihWGoczsj1i5M9kcjEXaQ=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: micron.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4414cfc2-6c39-416b-dbfb-08d6e9fb42c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 21:17:48.3179
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: beanhuo@micron.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR08MB3843
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi, Bjorn
I think I should give up my preview suggestion DME_ENDPOINTRESET.req softwa=
re reset,  go back to your HW reset.
Although SW reset can cover most of the requirement, and compatible with di=
fferent vendor UFS device, for some device
fatal error cases, UFS internal stuck and would not accept SW Reset. An HW =
reset is expected. =20
Please go on your reset way.

Thanks,
//Bean

>Andy Gross <agross@kernel.org>; Linus Walleij <linus.walleij@linaro.org>;
>Rob Herring <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>;
>linux-arm-msm@vger.kernel.org; linux-gpio@vger.kernel.org;
>devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
>scsi@vger.kernel.org
>Subject: Re: [EXT] [PATCH 2/3] scsi: ufs: Allow resetting the UFS device
>
>On Tue 04 Jun 01:13 PDT 2019, Bean Huo (beanhuo) wrote:
>> >@@ -6159,6 +6179,9 @@ static int ufshcd_reset_and_restore(struct
>> >ufs_hba
>> >*hba)
>> > 	int retries =3D MAX_HOST_RESET_RETRIES;
>> >
>> > 	do {
>> >+		/* Reset the attached device */
>> >+		ufshcd_device_reset(hba);
>> >+
>>
>> what's problem you met, and you should reset UFS device here? could you
>give more info?
>>
>> It is true that we don't reset UFS device in case of device fatal
>> error. According to UFS host spec, Host should be device reset except
>> that in addition to resetting UIC. But as so far, We didn't experience a=
ny
>problems result from this missing reset.
>>
>> We have three UFS device reset ways.  Comparing to this hardware
>> reset, I prefer to use DME_ENDPOINTRESET.req software reset.
>>
>
>Hi Bean,
>
>Thanks for your questions. With some memories we see issues establishing
>the link during bootup, so that's the purpose of issuing this reset.
>
>Unfortunately the downstream Qualcomm patch [1] (which I should have
>remembered to attribute), does not mention why the reset during host
>controller reset is needed - but I'm fairly certain that this scenario wou=
ld be
>similar to the handover from bootloader to kernel that we do see an issue
>with.
>
>
>[1]
>https://nam01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsource
>.codeaurora.org%2Fquic%2Fla%2Fkernel%2Fmsm-
>4.4%2Fcommit%2F%3Fh%3Dmsm-
>4.4%26id%3D0c82737188e2d63a08196e078e411032dbbc3b89&amp;data=3D02%
>7C01%7Cbeanhuo%40micron.com%7Cf72404eb906440e1f9c408d6e93c401d%7
>Cf38a5ecd28134862b11bac1d563c806f%7C0%7C0%7C636952842324926509&a
>mp;sdata=3DI%2FH7km6b34jyoUa1RVEPApfYt5uSFtHqL3%2BvV1bvryM%3D&amp
>;reserved=3D0
>
>Regards,
>Bjorn
