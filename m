Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEBE860E2D9
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Oct 2022 16:06:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234128AbiJZOG3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Oct 2022 10:06:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234134AbiJZOG2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2022 10:06:28 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57D53D8EC3
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2022 07:06:26 -0700 (PDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29QBEVBB002315;
        Wed, 26 Oct 2022 14:06:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=kgaVnxSQq9yOhEmGj4am/RZQLycSUFSBPqBfdEoaQrc=;
 b=IeyzQbgiz6vRfN2i0B4OsdtxHDmwDeN5pSNtFZnCINdu+dnG7zoQGymvEOC1gs9rwkzH
 IdPMbpVSbHiwcs6ZOFRmbIpPF3tck1iDWhXRDGaCPAwhG3S8qzsQ+S6hjBeLaed8MuLQ
 5muKQmYo2U94IJO5cobaP32kEw53UA6hq3pGJ/+r3LFLuzqDf6D2r69cXquz6/1l1hJA
 /PFi0B6OLNUUMtOe2tNnViEmhaoFLd/RNNaWFw81loqW1y3eWrZZCvR5OkUEIJuWMgHy
 mRJDs7jx8VUOTNJhIIkz3aTF2QNkP6mz7LUVH8T6lcpw5auHWEhC7YSVYqF2pUgZPMEK mQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kc8dbpgsy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 26 Oct 2022 14:06:18 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 29QD1Eml036189;
        Wed, 26 Oct 2022 14:05:26 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3kc6ybttba-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 26 Oct 2022 14:05:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=htcpoB5NAZt+6Iuq/dK2d+p4rwouQbEiHxsMIPbQe8PkD39Lu41zfKti2bMbSlo47r1s5f078dnCqez++bmL1/3ptHBpq4kyvPtqIOlsnk/dQPYRh36m3toSmz38vIgj3JLZAwJwTY3OGAQC28/cmcOwUhlJMlxdmJd66hEKHhAMkhl8lhb45Y78mFHdR2RzrEosfgMTtw7MpVgH2sPI+MORNV4r+/92nt7EYSYIRlVE+hqahKC6BDwyfSAOkxq9VJClprryMNn0S2dAGrKtCJNTtmIrFEajGlX5eeZhFWyAgDUH+Wsv2uuLspAaGuMeROQAddU0UziQE09IU1TF6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kgaVnxSQq9yOhEmGj4am/RZQLycSUFSBPqBfdEoaQrc=;
 b=kyOSKzkgB8rDV5OvAK75MAYp8shlY+hTFvpWUw5w3vhI4IOpCq8bgxFqbWGXfr6n1MrjMfxH0Qtez3ub560tMCwU9GuLbhUhwpVdS7doAPsYoh3Hx2gVMm2cuB7O9n+b2E58lZlk0mrd0aLMqkO5x06GzXCBiML2JFXQaY1mukHus/gT5Wbp44ZtblD58FL1CjW/e8tCQYqdk4xpxz40CBltfKCoUIzC8sj1G54reYaqbrs1tRQXdyHowRXOCSCJ8gDIk4zlbKD9eIdRr3td0NFJWD3c4Nlf2ZorjLu4DZ8IbzvDckuzxMqYFzInXYLt/txFsgpsnP4Vdn6MIM5z0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kgaVnxSQq9yOhEmGj4am/RZQLycSUFSBPqBfdEoaQrc=;
 b=eguuPjOe8BFlii6Gm+uCdS5mQfleJASBy8KPWgzuTReWhD0ZOzp80MAkS33POmeHLPn6ZY5Pq0E05ANi36tJ+Z9+Ouuz4IM+CIbt87o36iZDYpjeSva1lh+2LaCdj2n8VIo4UA80wXFNFi8r/Jy3Dq4BLKuRuHl4MpdNgeTpDGc=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CH0PR10MB5308.namprd10.prod.outlook.com
 (2603:10b6:610:c6::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Wed, 26 Oct
 2022 14:05:23 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec%4]) with mapi id 15.20.5676.031; Wed, 26 Oct 2022
 14:05:23 +0000
Date:   Wed, 26 Oct 2022 17:05:16 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-gpio@vger.kernel.org
Subject: [bug report] tty: st-asc: switch to using devm_gpiod_get()
Message-ID: <Y1k+nMCs0gCh0/er@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0165.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:45::18) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|CH0PR10MB5308:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eadfc66-a1fe-4d8d-7038-08dab75b1fcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XBzRZLSafZtb6QNDLqx79JzKi/Qh7nX8Qaj1JwVhf41MZ3WsfSCxn1tMZdhJmEJjh323hJbGERGrc9ZIz1wsTzbX7ew5GaK2okUG7UHYGy8gNfnfM1ftBNc98q9a7SmmvMnYcusiOHn/faAFo5uCGEwVPc6jkqmtGsl8uZ2Nf3RXhwvMANi5b+CDBGGl4Rdotn7qdGd0hvQbjHEH4JG56ltVsoGRK1Jk+mxKfG7+pMAZaxB+7ckMHHRNMyLbvKghywu+MCiPaROM+xTMO5Kx2NOxy88Km8GgW6+rsFr8HFzgh9ewIcaiDakrwbpT++TqV1ZHdJph28Jev/M75XP7ghO4uTqGNybqJroIwLksL4XQVE3BSbUNSluH8eoTZE4E3SMH2nebjycJyefUxC1BcNjdPcHFuEMlSkbocTL29s8H6kiy6V7Gty24C2Xw3IGLZLziSAuTMt1Hwja2fKLxM7PLwpQAazoH8QykSHVB9p4mbw6PoIAddrUumC3VJvUY3ozuyt/mF6LleXCptfWpdi0q0V3kRZrfUTe37oREfqHXd2W0OMc/JLsuTUYBeJnamMFusn6EcyZJmJt1IGg5rRsbece7SI4pLxdl71SleeQLXexYFMLxmeytlhzqLVksyNt286+tF13AA0pAnJf5PLdH3OY1iMEGI3eX+aWvN7ZzWal7Rk/X2UYILcBp5sXKh7Ert6sY50XGpkOIgL9oWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(346002)(136003)(396003)(39860400002)(366004)(376002)(451199015)(44832011)(9686003)(2906002)(26005)(6666004)(6512007)(86362001)(6506007)(8676002)(66476007)(66946007)(4326008)(66556008)(41300700001)(5660300002)(316002)(6916009)(8936002)(478600001)(6486002)(33716001)(38100700002)(83380400001)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yt9s/fpFr+/W8Mh3F8Lv8xdQAvImUhdIszAG4thcndCau8dARgQahHZpWy5d?=
 =?us-ascii?Q?HcN+LLQloRA5ZbU0HXU3Pgm8aJKIIaFOJgA/mQOiAfIHUdtvSAlOTfvVG87B?=
 =?us-ascii?Q?eDOEeFzSc4YikFH9qE7/oiVszyZM9ELXJN1oU2PnPlaeQ2b2v0d0SFM1FcfF?=
 =?us-ascii?Q?pzjuaTb9stpyMvX4tlKdy6ESrjsLT2Vk/1UVUZUEgEfogRCTTR8GZpCEP6IC?=
 =?us-ascii?Q?YX8VwM7reFZ4Ve2jilSHyqK8wLPBUS8wd7icuyyNdsPmqYqkZUvKlI40mY2J?=
 =?us-ascii?Q?tLnXM+hySMmoJIxYmv6eC2JKe33q4LPH3eGKO2U9tbQ0RFpMWabdCuL2iVd6?=
 =?us-ascii?Q?y+T0FyxEYpTEihpBRnvOeGBLmCH6Ltb6pUTSE1YmIjQ3YPv1LsHnmJP73jJq?=
 =?us-ascii?Q?4OAxWaJfkfG0ovPGataxzFKlfLt2Kt74De4OeMQn6zUubwSxvl3q5B8iKA81?=
 =?us-ascii?Q?CsNPsjkTl8VHyF6s27dUTb9YmN9fe8L2PiiJcRPe3DADY3BVMii8Z4qOqenx?=
 =?us-ascii?Q?CHyVF56740EZSI6cRS+qoAyF0rEIGmRxt3l48hbhNNMWhxQzaSTg48GfogyU?=
 =?us-ascii?Q?VhdhMgC+btWD7Ztqaopc8KVbm2fq6aVr5tuPOu2VmiHW4m1kbl4YrSr/rgtn?=
 =?us-ascii?Q?mjYnK+HK/3LiUaY9vyrPXTgR9v9tg9T7RGmHf+M6mJxnxBtrDCBtv+pcbU/7?=
 =?us-ascii?Q?AVU9M61WntjA6BDWr2xjQHCNr9doSeQpUY4+0QGbShnVOEAeWzay5U1gXVZW?=
 =?us-ascii?Q?i8ZQ7H5Peeb31mefDFqnXOhbkbMpDhAzLdBVZsARc45HwYO71SFVkXwDPjKt?=
 =?us-ascii?Q?Ip4oFgO/4W3Ms3x0SsyUx9EcFdqrBzrUuZMxQBOqKSzoWUwA4W9Y0U3NEegG?=
 =?us-ascii?Q?br4oB+YHNJgIL0oh1hcOPjPNeC5NXTvqZhPcCVsG0kI/qHnfTtyECnqYYaHY?=
 =?us-ascii?Q?M1h2kJH4m8uPGVhHi/cxfQOYWL1dL12BeHaeu/ynD9P6EqgyES+kkeaadNV6?=
 =?us-ascii?Q?aPGrcgCwz/2cnqDtU++4DtSfDvTRhEdEjmQINF2YGEWkj0jj7N3wqI1c08mm?=
 =?us-ascii?Q?tlryvDeczqGtgPJ0YW5uyiSU2V3g2j7NC15/e2IyfzATHwJn1Xv3fOsjo9Ii?=
 =?us-ascii?Q?XmCYMdLRLBWe4tH6a95pGfvsUdJss2T00k1TxHGv5kos4UhF+E+63t/gi0aL?=
 =?us-ascii?Q?McqHeYrNg+th0CneuTBq2mz/ZfZKcbhT8d/X87osD71tmtmZ/X2IXAvUvfeM?=
 =?us-ascii?Q?U9HSgsD6FSuvqeMzpcvgfFJs14Ir338YvIylVuFmh8gdYejQ3U6jPZMmUJgR?=
 =?us-ascii?Q?E5V5d7JGYHEDudDVV5ps1dYLxky3Y9L4ZGC8D6GyC6P6P1qSQHTwqR8235Bx?=
 =?us-ascii?Q?Hu4zbkkOvWGS9xz4MkFVOUtRUsWeQ98EA0QoGfHxm+O/JtS+Ct88io6/Rt0b?=
 =?us-ascii?Q?0LYKG/CBoZgagABOUjeLQZgrNJpDnJJCLGAb+rLk+xkGEvl20/1olVSIHhuu?=
 =?us-ascii?Q?mnZpbvxEBAtBqMkN6aZYjH4jOr0VH+LRRuw0GQ+c6+ACnqJL19ff8Hn+v7d0?=
 =?us-ascii?Q?Jck2Oa/MGqLHheDvx0bnhjCppUz+8eBFkkd5/7IF/Iyx70SP1GN7dDfDStqV?=
 =?us-ascii?Q?Mw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eadfc66-a1fe-4d8d-7038-08dab75b1fcd
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 14:05:23.1685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3O4XPsRNM7VBLgre2YJ/PA4671W+JYCGMMBufKFfv06nb4Kf3i7Lg8BXpKUy4LYQeCJxni+W61pDsHa3JWBujkCtolmqFeyW96RyMn2fnKk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5308
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-26_06,2022-10-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0
 mlxlogscore=865 malwarescore=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210260079
X-Proofpoint-ORIG-GUID: jXVNN2FOkC60SIaqY9XXnkn9C17gW6ue
X-Proofpoint-GUID: jXVNN2FOkC60SIaqY9XXnkn9C17gW6ue
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Dmitry Torokhov,

The patch 8c44f9b566a3: "tty: st-asc: switch to using
devm_gpiod_get()" from Jan 4, 2020, leads to the following Smatch
static checker warning:

	drivers/gpio/gpiolib-devres.c:118 devm_gpiod_get_index()
	warn: sleeping in atomic context

The call tree is:

asc_set_termios() <- disables preempt (spin_lock)
-> devm_gpiod_get()
   -> devm_gpiod_get_index()

drivers/tty/serial/st-asc.c
   502  static void asc_set_termios(struct uart_port *port, struct ktermios *termios,
   503                              const struct ktermios *old)
   504  {
   505          struct asc_port *ascport = to_asc_port(port);
   506          struct gpio_desc *gpiod;
   507          unsigned int baud;
   508          u32 ctrl_val;
   509          tcflag_t cflag;
   510          unsigned long flags;
   511  
   512          /* Update termios to reflect hardware capabilities */
   513          termios->c_cflag &= ~(CMSPAR |
   514                           (ascport->hw_flow_control ? 0 : CRTSCTS));
   515  
   516          port->uartclk = clk_get_rate(ascport->clk);
   517  
   518          baud = uart_get_baud_rate(port, termios, old, 0, port->uartclk/16);
   519          cflag = termios->c_cflag;
   520  
   521          spin_lock_irqsave(&port->lock, flags);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
disables preempt

   522  
   523          /* read control register */
   524          ctrl_val = asc_in(port, ASC_CTL);
   525  
   526          /* stop serial port and reset value */
   527          asc_out(port, ASC_CTL, (ctrl_val & ~ASC_CTL_RUN));
   528          ctrl_val = ASC_CTL_RXENABLE | ASC_CTL_FIFOENABLE;
   529  
   530          /* reset fifo rx & tx */
   531          asc_out(port, ASC_TXRESET, 1);
   532          asc_out(port, ASC_RXRESET, 1);
   533  
   534          /* set character length */
   535          if ((cflag & CSIZE) == CS7) {
   536                  ctrl_val |= ASC_CTL_MODE_7BIT_PAR;
   537                  cflag |= PARENB;
   538          } else {
   539                  ctrl_val |= (cflag & PARENB) ?  ASC_CTL_MODE_8BIT_PAR :
   540                                                  ASC_CTL_MODE_8BIT;
   541                  cflag &= ~CSIZE;
   542                  cflag |= CS8;
   543          }
   544          termios->c_cflag = cflag;
   545  
   546          /* set stop bit */
   547          ctrl_val |= (cflag & CSTOPB) ? ASC_CTL_STOP_2BIT : ASC_CTL_STOP_1BIT;
   548  
   549          /* odd parity */
   550          if (cflag & PARODD)
   551                  ctrl_val |= ASC_CTL_PARITYODD;
   552  
   553          /* hardware flow control */
   554          if ((cflag & CRTSCTS)) {
   555                  ctrl_val |= ASC_CTL_CTSENABLE;
   556  
   557                  /* If flow-control selected, stop handling RTS manually */
   558                  if (ascport->rts) {
   559                          devm_gpiod_put(port->dev, ascport->rts);
   560                          ascport->rts = NULL;
   561  
   562                          pinctrl_select_state(ascport->pinctrl,
   563                                               ascport->states[DEFAULT]);
   564                  }
   565          } else {
   566                  /* If flow-control disabled, it's safe to handle RTS manually */
   567                  if (!ascport->rts && ascport->states[NO_HW_FLOWCTRL]) {
   568                          pinctrl_select_state(ascport->pinctrl,
   569                                               ascport->states[NO_HW_FLOWCTRL]);
   570  
   571                          gpiod = devm_gpiod_get(port->dev, "rts", GPIOD_OUT_LOW);
                                        ^^^^^^^^^^^^^^
Sleeps


   572                          if (!IS_ERR(gpiod)) {
   573                                  gpiod_set_consumer_name(gpiod,
   574                                                  port->dev->of_node->name);
   575                                  ascport->rts = gpiod;
   576                          }
   577                  }
   578          }
   579  
   580          if ((baud < 19200) && !ascport->force_m1) {
   581                  asc_out(port, ASC_BAUDRATE, (port->uartclk / (16 * baud)));
   582          } else {
   583                  /*
   584                   * MODE 1: recommended for high bit rates (above 19.2K)

[ snip ]

drivers/gpio/gpiolib-devres.c
    108          */
    109         if (flags & GPIOD_FLAGS_BIT_NONEXCLUSIVE) {
    110                 struct devres *dres;
    111 
    112                 dres = devres_find(dev, devm_gpiod_release,
    113                                    devm_gpiod_match, &desc);
    114                 if (dres)
    115                         return desc;
    116         }
    117 
--> 118         dr = devres_alloc(devm_gpiod_release, sizeof(struct gpio_desc *),
    119                           GFP_KERNEL);
                                  ^^^^^^^^^^
Sleeping here.

    120         if (!dr) {
    121                 gpiod_put(desc);
    122                 return ERR_PTR(-ENOMEM);
    123         }
    124 
    125         *dr = desc;
    126         devres_add(dev, dr);
    127 
    128         return desc;
    129 }

regards,
dan carpenter
